import 'package:get/get.dart';

class LecNoteController extends GetxController {
  //TODO: Implement LecNoteController

  //static const x = 0;
  RxBool isPlaying = false.obs; 
  // Flag to track playback state
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
