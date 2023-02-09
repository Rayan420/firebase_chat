import 'package:firebase_chat/pages/application/index.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(()=>ApplicationController());
  }

}