import 'package:firebase_chat/common/entities/entities.dart';
import 'package:firebase_chat/common/widgets/widgets.dart';
import 'package:firebase_chat/pages/profile/index.dart';
import 'package:firebase_chat/pages/profile/widgets/head_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/values/colors.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  AppBar _buildAppBar(){
    return transparentAppBar(
      title: Text(
          "Profile",
        style: TextStyle(
          color: AppColors.primaryBackground,
          fontSize: 19.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget MeItem(MeListItem item){
    return Container(
      height: 56.w,
      color: AppColors.primaryBackground,
      margin: EdgeInsets.only(bottom: 1.w),
      padding: EdgeInsets.only(top: 0.w, left: 15.w, right: 15.w),
      child: InkWell(
        onTap: (){

          // do something
          if(item.route=="/logout")
            {
              controller.onLogOut();
            }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 56.w,
                  child: Image(
                    image: AssetImage(
                      item.icon??""
                    ),
                    width: 40.w,
                    height: 40.w,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 14.w,),
                  child: Text(
                    item.name??"",
                    style: TextStyle(
                      color: AppColors.thirdElement,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image(image: const AssetImage("assets/icons/ang.png"),
                    width: 15.w,
                    height: 15.w,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(() => CustomScrollView(
        slivers: [
          SliverPadding(
              padding: EdgeInsets.symmetric(
            vertical: 0.w,
                horizontal: 0.w,
          ),
            sliver: SliverToBoxAdapter(
              child: controller.state.head_detail.value==null
                  ?Container():HeadItem(controller.state.head_detail.value!),
            ),
          ),

        SliverPadding(
          padding: EdgeInsets.symmetric
            (vertical: 0.w,
              horizontal: 0.w
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              var item=controller.state.meListItem[index];
              return MeItem(item);
            },
              childCount: controller.state.meListItem.length,
            ),
          )
        ),
      ],
      ),
      ),
    );
  }
}
