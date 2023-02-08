import 'package:firebase_chat/pages/welcome/index.dart';
import 'package:get/get.dart';


class WelcomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(()=>WelcomeController());
  }

}