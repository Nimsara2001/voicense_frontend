import 'package:get/get.dart';

import '../controllers/note_set_of_module_controller.dart';

class NoteSetOfModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteSetOfModuleController>(
      () => NoteSetOfModuleController(),
    );
  }
}
