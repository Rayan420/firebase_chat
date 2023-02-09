import 'package:firebase_chat/pages/chat/index.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(()=>ChatController());
  }

}