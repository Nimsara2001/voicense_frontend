import 'package:get/get.dart';

import '../controllers/select_module_controller.dart';

class SelectModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectModuleController>(
      () => SelectModuleController(),
    );
  }
}
