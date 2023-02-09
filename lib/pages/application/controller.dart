import 'package:firebase_chat/pages/application/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/values/colors.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();

  ApplicationController();

  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handlePageChanged(int index)
  {
    state.page=index;
  }

  @override
  void onInit() {
    super.onInit();
    tabTitles = ['chat', 'contacts', 'profile'];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.message_rounded,
          color: AppColors.thirdElementText,
        ),
        activeIcon: Icon(
          Icons.message_rounded,
          color: AppColors.secondaryElementText,
        ),
        label: "chat",
        backgroundColor: AppColors.primaryBackground,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.contact_page_rounded,
          color: AppColors.thirdElementText,
        ),
        activeIcon: Icon(
          Icons.contact_page_rounded,
          color: AppColors.secondaryElementText,
        ),
        label: "contact",
        backgroundColor: AppColors.primaryBackground,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.person_2_rounded,
          color: AppColors.thirdElementText,
        ),
        activeIcon: Icon(
          Icons.person_2_rounded,
          color: AppColors.secondaryElementText,
        ),
        label: "person",
        backgroundColor: AppColors.primaryBackground,
      ),
    ];
    pageController = PageController(initialPage: state.page);
  }

  @override
  void dispose()
  {
    pageController.dispose();
    super.dispose();
  }
}
