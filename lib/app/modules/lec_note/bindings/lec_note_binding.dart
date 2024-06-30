import 'package:get/get.dart';
import '../controllers/lec_note_controller.dart';

class LecNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LecNoteController>(
      () => LecNoteController(),  
    );
  }
}
