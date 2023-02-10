import 'package:firebase_chat/pages/messages/chat/widgets/left_chat_bubble.dart';
import 'package:firebase_chat/pages/messages/chat/widgets/right_chat_bubble.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_chat/pages/messages/chat/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/values/colors.dart';

class ChatList extends GetView<ChatController> {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Container(
          color: AppColors.chatbg,
          padding: EdgeInsets.only(bottom: 50.h),
          child: CustomScrollView(
            reverse: true,
            controller: controller.msgScrolling,
            slivers: [
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 0.w,horizontal: 0.w),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (context, index){
                        var item = controller.state.msgcontentList[index];
                        if(controller.user_id==item.uid)
                        {
                          return RightChatBubble(item);
                        }
                        else
                          return LeftChatBubble(item);

                          },
                    childCount: controller.state.msgcontentList.length,
                  ),
                ),
              ),

            ],
          ),

        ),);
  }
}
