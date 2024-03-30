import 'package:get/get.dart';

import '../controllers/common_he_controller.dart';

class CommonHeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommonHeController>(
          () => CommonHeController(Get.arguments as String),
    );
  }
}
