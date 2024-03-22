import 'package:get/get.dart';

import '../controllers/stu_home_controller.dart';

class StuHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StuHomeController>(
      () => StuHomeController(),
    );
  }
}
