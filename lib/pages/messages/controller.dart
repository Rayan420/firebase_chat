import 'package:firebase_chat/common/entities/mylocation.dart';
import 'package:firebase_chat/common/utils/http.dart';
import 'package:firebase_chat/pages/messages/state.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../common/entities/msg.dart';
import '../../common/store/user.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:location/location.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class MessagesController extends GetxController{

  MessagesController();
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  final MessagesState state = MessagesState();
  var listener;

  final RefreshController refreshController = RefreshController(
      initialRefresh:true,
      );

  @override
  void onReady()
  {
    super.onReady();
    getUserLocation();
    getFcmToken();
  }
  void onRefresh() async{
    asyncLoadAllData().then((_){
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((_){
      refreshController.refreshFailed();
    });
  }

  void onLoading() async{
    asyncLoadAllData().then((_){
      refreshController.loadComplete();
    }).catchError((_){
      refreshController.loadFailed();
    });

  }

  asyncLoadAllData() async{
    var from_messages =await db.collection("messages").withConverter(
        fromFirestore: Msg.fromFirestore,
        toFirestore: (Msg msg, options)=> msg.toFirestore()).where(
      "from_uid", isEqualTo: token
    ).get();

    var to_messages =await db.collection("messages").withConverter(
        fromFirestore: Msg.fromFirestore,
        toFirestore: (Msg msg, options)=> msg.toFirestore()).where(
        "to_uid", isEqualTo: token
    ).get();

    state.msglist.clear();
    if(from_messages.docs.isNotEmpty)
      {
        state.msglist.assignAll(from_messages.docs);
      }

    if(to_messages.docs.isNotEmpty)
    {
      state.msglist.assignAll(to_messages.docs);
    }
  }

  getUserLocation() async{
    try{
      final location = await Location().getLocation();
      String address = "${location.latitude}, ${location.longitude}";
      String url = "https://maps.google.apis.com/maps/api/geocode/json?address=${address}&key=AIzaSyB6uESTwfrCQMHzTnXBumheZVjQUx7eH-M";
      var response = await HttpUtil().get(url);
      MyLocation location_res = MyLocation.fromJson(response);
      if(location_res.status=="OK")
        {
          String? myAddress = location_res.results?.first.formattedAddress;
          if(myAddress!=null)
            {
              var user_location = await db.collection("users").where("id", isEqualTo: token).get();
              if(user_location.docs.isNotEmpty)
                {
                  var doc_id = user_location.docs.first.id;
                  await db.collection("users").doc(doc_id).update({"location":myAddress});
                }
            }
        }

    }catch(e)
    {
      print("getting error $e");
    }
  }

  getFcmToken()
  async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if(fcmToken!=null)
      {
        var user = await db.collection("users").where("id", isEqualTo: token).get();
        if(user.docs.isNotEmpty)
          {
            var doc_id=user.docs.first.id;
            await db.collection("users").doc(doc_id).update({"fcmtoken":fcmToken});
          }
      }
  }
}