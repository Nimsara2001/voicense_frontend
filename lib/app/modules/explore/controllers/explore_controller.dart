import 'package:get/get.dart';

class ExploreController extends GetxController {
  String userType;
  var index = 0.obs;
  ExploreController(this.userType);

  @override
  void onInit() {
    super.onInit();
     if (userType == 'Lecturer') {
     index.value = 0;
    } else if (userType == 'Student') {
     index.value = 1;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
