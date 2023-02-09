import 'package:firebase_chat/common/widgets/button.dart';
import 'package:firebase_chat/pages/welcome/index.dart';
import 'package:flutter/material.dart';
import'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../common/values/colors.dart';
import '../../common/values/shadows.dart';
import 'controller.dart';


class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);


  AppBar _buildAppBar()
  {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 176, 106, 231),
            Color.fromARGB(255, 166, 112, 231),
            Color.fromARGB(255, 131, 123, 231),
            Color.fromARGB(255, 104, 132, 231),

          ],

          )
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {




    return  Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          children:
          [

          ],
      ),
      ),
    );
  }
}
