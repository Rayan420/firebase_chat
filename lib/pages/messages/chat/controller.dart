import 'package:firebase_chat/common/entities/entities.dart';
import 'package:firebase_chat/common/store/store.dart';
import 'package:firebase_chat/common/utils/security.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'index.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';




class ChatController extends GetxController{
  ChatController();
  ChatState state = ChatState();

  var doc_id = null;

  final textController = TextEditingController();
  ScrollController msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();
  final user_id = UserStore.to.token;
  final db = FirebaseFirestore.instance;
var listener;

File? _photo;
final ImagePicker _picker = ImagePicker();

Future imgFromGallary() async{
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  if(pickedFile!=null)
    {
      // might caUSE ERROR
      _photo = File(pickedFile.path);
      uploadFile();
    }
  else
    {
      print("no image selected");
    }
}

Future getImgUrl(String name) async{
  final spaceRef = FirebaseStorage.instance.ref("chat").child(name);
  var str = await spaceRef.getDownloadURL();
  return str??"";
}
Future uploadFile() async{
  if(_photo==null) return;
  final fileName = getRandomString(15)+extension(_photo!.path);
  try
      {
        final ref = FirebaseStorage.instance.ref("chat").child(fileName);
        await ref.putFile(_photo!).snapshotEvents.listen((event) async{
          switch(event.state){
            case TaskState.running:
              break;
            case TaskState.paused:
              break;
            case TaskState.success:
              String imgUrl = await getImgUrl(fileName);
          }
        });
      }
      catch(e){
    print("there is an error");
      }
}



  @override
  void onInit()
  {
    super.onInit();
    var data = Get.parameters;
    doc_id = data["doc_id"];
    state.to_uid.value = data["to_uid"]??"";
    state.to_name.value = data["to_name"]??"";
    state.to_avatar.value = data["to_avatar"]??"";
  }

  sendMessage()
  async{
    String sendContent = textController.text;
    final content = Msgcontent(
      uid: user_id,
      content: sendContent,
      type: "text",
      addtime: Timestamp.now(),
    );
    await db.collection("messages").doc(doc_id).collection("messageList").withConverter(
        fromFirestore: Msgcontent.fromFirestore,
        toFirestore: (Msgcontent msgcontent, options)=>msgcontent.toFirestore()).add(content).then((DocumentReference doc){
          print("document snapshot added with id, ${doc.id}");
          textController.clear();
          Get.focusScope?.unfocus();
    });

    await db.collection("messages").doc(doc_id).update({
      "last_msg":sendContent,
      "last time":Timestamp.now(),
    },
    );
  }

@override
  void onReady() {
  super.onReady();

  var messages =  db.collection("messages").doc(doc_id).collection("messageList").withConverter(
      fromFirestore: Msgcontent.fromFirestore,
      toFirestore: (Msgcontent msgcontent, options)=> msgcontent.toFirestore()
  ).orderBy("addtime", descending: false);
  state.msgcontentList.clear();
  listener = messages.snapshots().listen((event) {
    for(var change in event.docChanges)
      {
        switch(change.type)
        {
          case DocumentChangeType.added:
            if(change.doc.data()!=null){
              state.msgcontentList.insert(0, change.doc.data()!);
            }
            break;
            //in case of adding a functionality to modify chat
          case DocumentChangeType.modified:
            break;
        //in case of adding a functionality to delete chat
          case DocumentChangeType.removed:
            break;

    }
      }

  },
    onError: (error)=>print("Listen failed: $error")
  );
}

@override
  void dispose()
{
  msgScrolling.dispose();
  listener.cancel();
  super.dispose();
}

}