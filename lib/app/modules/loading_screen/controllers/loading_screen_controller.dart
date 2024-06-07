// loading_controller.dart
import 'package:get/get.dart';

class LoadingScreenController extends GetxController {
  // Observable variable to manage loading state
  var isLoading = false.obs;

  // Function to start loading
  void startLoading() {
    isLoading.value = true;
  }

  // Function to stop loading
  void stopLoading() {
    isLoading.value = false;
  }

  // Function to toggle loading state
  void toggleLoading() {
    isLoading.value = !isLoading.value;
  }

  // Function to simulate a network request or a long-running task
  void simulateLoading({int durationInSeconds = 3}) {
    startLoading();
    Future.delayed(Duration(seconds: durationInSeconds), () {
      stopLoading();
    });
  }
}
