import 'package:firebase_chat/common/widgets/button.dart';
import 'package:firebase_chat/pages/contact/index.dart';
import 'package:firebase_chat/pages/contact/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../common/values/colors.dart';
import '../../common/values/shadows.dart';
import '../../common/widgets/app.dart';
import 'controller.dart';


class ContactPage extends GetView<ContactController> {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
print(controller.state.contactList.length);
    AppBar _buildAppBar()
    {
      return transparentAppBar(
      title: Text("Contacts",
        style: TextStyle(
          color: AppColors.primaryBackground,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),

      );
    }
    return  Scaffold(
      appBar: _buildAppBar(),
      body: ContactList(),
    );
  }
}
