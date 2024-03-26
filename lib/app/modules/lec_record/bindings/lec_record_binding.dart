import 'package:get/get.dart';

import '../controllers/lec_record_controller.dart';

class LecRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LecRecordController>(
          () => LecRecordController(),
    );
  }
}