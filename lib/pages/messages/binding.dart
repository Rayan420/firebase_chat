import 'package:firebase_chat/pages/messages/index.dart';
import 'package:get/get.dart';

class MessageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MessagesController>(()=>MessagesController());

  }

}