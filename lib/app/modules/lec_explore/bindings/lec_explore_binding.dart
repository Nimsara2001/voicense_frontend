import 'package:get/get.dart';

import '../controllers/lec_explore_controller.dart';

class LecExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LecExploreController>(
      () => LecExploreController(),
    );
  }
}
