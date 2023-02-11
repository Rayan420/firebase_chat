
import 'package:firebase_chat/pages/messages/chat/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../../common/values/colors.dart';
import 'controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);


  AppBar _buildAppBar()
  {
    return AppBar(

      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 176, 106, 231),
            Color.fromARGB(255, 166, 112, 231),
            Color.fromARGB(255, 131, 123, 231),
            Color.fromARGB(255, 104, 132, 231),

          ],
            transform: GradientRotation(90),


          )
        ),
      ),
      title: Container(
        padding: EdgeInsets.only(top: 0.w,bottom: 0.w,right: 0.w),
        child: Row(children: [
          Container(
            padding: EdgeInsets.only(top: 5.w,bottom: 0.w,right: 0.w),
            child: InkWell(
              child: SizedBox(
                width: 44.w,
                height: 44.w,
                child: CachedNetworkImage(imageUrl: controller.state.to_avatar.value,
                  imageBuilder: (context, imageProvider)=> Container(height: 44.w,
                    width: 44.w,
                    margin: null,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(44.w),
                      ),
                      image: DecorationImage(image:
                    imageProvider,
                    fit: BoxFit.cover,
                    ),
                    ),
                ),
                  errorWidget: (context, url, error)=> Image(
                    image: AssetImage("asset/images/feature-1.png"),
                  ),
              ),
            ),
          ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Container(
            width: 180.w,
            padding: EdgeInsets.only(top: 18.w,bottom: 0.w,right: 0.w),
            child: Row(children: [
            SizedBox(
              width: 180.w,
              height: 54.w,
              child: GestureDetector(
                onTap: (){

                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // user name
                    Text(
                      controller.state.to_name.value,
                    overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBackground,
                        fontSize: 16.sp,
                      ),
                    ),
                    // location
                    Text(
                      "Location is private",
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryBackground,
                        fontSize: 14.sp,
                      ),
                    )
                  ],
                ),
              ),
            ),
            ],
            ),

          ),
        ],
        ),
      ),
    );
  }

  void _showPicker(context)
  {
    showModalBottomSheet(
        context: context, builder: (BuildContext bc){
          return SafeArea(child: Wrap(
            children: [
              ListTile(
                leading:Icon(
                  Icons.photo_library_rounded,),
                title: Text("Gallary"),
                onTap: (){
                  controller.imgFromGallary();
                  Get.back();
                },
              ),
              ListTile(
                leading:Icon(
                  Icons.photo_camera_rounded,),
                title: Text("Camera"),
                onTap: (){

                },
              ),
            ],
          ),
          );
    }
    );
  }
  @override
  Widget build(BuildContext context) {




    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
    child: _buildAppBar(),),
      body: SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
              child: Stack(
                children: [
                  ChatList(),
                  Positioned(
                    bottom: 0.h,
                    height: 50.h,
                    child:
                  Container(
                    width: 360.w,
                    height: 50.h,
                    color: AppColors.primaryBackground,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 250.w,
                          height: 50.w,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            controller: controller.textController,
                            autofocus: false,
                            focusNode: controller.contentNode,
                            decoration: const InputDecoration(
                              hintText: "Say Something...",
                            ),
                          ),
                        ),
                        Container(

                          height: 30.h,
                          width: 30.w,
                          margin: EdgeInsets.only(left: 10.w, top: 5.h),
                          child: GestureDetector(
                            child: new Icon(Icons.camera_alt_rounded,
                            size: 35.w,
                              color: Colors.blueAccent,
                            ),
                            onTap: (){
                              _showPicker(context);
                            },
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10.w, top: 5.h),
                          width: 45.w,
                          height: 35.w,
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.blueAccent
                            ),
                            onPressed: () {
                              controller.sendMessage();
                            },
                          child: Icon(Icons.arrow_forward_rounded),),
                        ),
                      ],
                    ),
                  ),
                  ),
                ],
              ),
          ),
      ),
    );
  }
}
