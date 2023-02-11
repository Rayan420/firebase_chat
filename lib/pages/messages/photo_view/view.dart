import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_chat/pages/messages/photo_view/index.dart';

import '../../../common/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PhotoImageViewPage extends GetView<PhotoImageViewController> {
  const PhotoImageViewPage({Key? key}) : super(key: key);

  AppBar _buildAppBar()
  {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Container(
          color: AppColors.secondaryElement,
          height: 2.0,
        ),
      ),
      title: Text("PhotoView",
        style:
      TextStyle(
          color: AppColors.primaryText,
      fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(controller.state.url.value),
        ),
      ),
    );
  }
}
