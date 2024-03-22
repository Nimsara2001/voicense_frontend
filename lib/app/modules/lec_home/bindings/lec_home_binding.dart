import 'package:get/get.dart';

import '../controllers/lec_home_controller.dart';

class LecHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LecHomeController>(
      () => LecHomeController(),
    );
  }
}
