import 'package:get/get.dart';

import '../controllers/rec_successful_controller.dart';

class RecSuccessfulBinding extends Bindings {
  RecSuccessfulBinding();

  @override
  void dependencies() {
    Get.lazyPut<RecSuccessfulController>(
      () => RecSuccessfulController(),
    );
  }
}
