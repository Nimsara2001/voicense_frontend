import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/lec_record/controllers/lec_record_file_helper.dart';
import 'package:voicense_frontend/app/modules/lec_record/controllers/lec_record_controller.dart';


// recorder_binding.dart
class RecorderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioRecorderController>(
          () => AudioRecorderController(
        Get.find<AudioRecorderFileHelper>(), // Use Get.find() to retrieve
        Get.find<RecorderErrorHandler>() as Function(String message), // the bound dependency
      ),
    );
  }
}


