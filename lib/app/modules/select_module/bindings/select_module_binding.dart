import 'package:get/get.dart';

import '../controllers/select_module_controller.dart';

class SelectModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectModuleController>(
      () => SelectModuleController(user_id: '6638b698f81ffd971fadfa52'),
    );
  }
}
