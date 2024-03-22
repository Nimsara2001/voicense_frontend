import 'package:get/get.dart';

import '../controllers/stu_note_controller.dart';

class StuNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StuNoteController>(
      () => StuNoteController(),
    );
  }
}
