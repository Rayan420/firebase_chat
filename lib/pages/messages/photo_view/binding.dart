import 'package:get/get.dart';

import 'controller.dart';

class PhotoImageViewBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PhotoImageViewController>(() => PhotoImageViewController());
  }



}