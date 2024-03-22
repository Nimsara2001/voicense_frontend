import 'package:get/get.dart';

import '../controllers/stu_explore_controller.dart';

class StuExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StuExploreController>(
      () => StuExploreController(),
    );
  }
}
