import 'package:get/get.dart';

import '../controllers/explore_controller.dart';

class LecExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreController>(
      () => ExploreController(Get.arguments as String),
    );
  }
}
