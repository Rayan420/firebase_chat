
import 'package:firebase_chat/pages/contact/index.dart';
import 'package:firebase_chat/pages/messages/view.dart';
import 'package:firebase_chat/pages/profile/index.dart';
import 'package:flutter/material.dart';
import'package:get/get.dart';
import '../../common/values/colors.dart';
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
        children: const[
          MessagesPage(),
          ContactPage(),
          ProfilePage(),

        ],

      );
    }

    Widget _buildBottomVavigationBar()
    {
      return Obx(
          ()=>BottomNavigationBar(
              items:controller.bottomTabs,
            currentIndex: controller.state.page,
            type: BottomNavigationBarType.fixed,
            onTap: controller.handleNavBarTap,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedItemColor: AppColors.tabBarElement,
            selectedItemColor: AppColors.thirdElementText,

          ),
      );
    }

    return  Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomVavigationBar(),
    );
  }
}
