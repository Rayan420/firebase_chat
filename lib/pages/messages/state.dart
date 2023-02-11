import 'package:firebase_chat/common/entities/msg.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MessagesState{
  RxList<QueryDocumentSnapshot<Msg>> msglist = <QueryDocumentSnapshot<Msg>>[].obs;


}