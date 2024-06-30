import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:voicense_frontend/app/models/note_model.dart';

import '../controllers/lec_note_controller.dart';

class LecNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LecNoteController>(
      () => LecNoteController(),  
    );
  }
}
