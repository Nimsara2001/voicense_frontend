import 'package:get/get.dart';
import 'package:voicense_frontend/app/models/module_model.dart';

import '../controllers/note_set_of_module_controller.dart';

class NoteSetOfModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteSetOfModuleController>(
      () => NoteSetOfModuleController(Get.arguments as Module),
    );
  }
}
