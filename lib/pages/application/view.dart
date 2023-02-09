//import 'package:firebase_chat/common/widgets/button.dart';
//import 'package:firebase_chat/pages/welcome/index.dart';
import 'package:flutter/material.dart';
import'package:get/get.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:dots_indicator/dots_indicator.dart';
//import '../../common/values/colors.dart';
//import '../../common/values/shadows.dart';
import 'controller.dart';


class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildPageView()
    {
      return PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.handlePageChanged,
        children: [
          Container(
            child: Text("chat"),
          ),
          Container(
            child: Text("contact"),
          ),
          Container(
            child: Text("profile"),
          ),
        ],

      );
    }

    return  Scaffold(
      body: _buildPageView(),
    );
  }
}
