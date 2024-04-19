import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// class SelectModuleController extends GetxController {
//   //TODO: Implement SelectModuleController

//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {}
//   void increment() => count.value++;
// }
class SelectModuleController extends GetxController {
  // Observable list to store fetched modules
  final RxList<dynamic> modules = RxList<dynamic>([]);

  // Function to fetch modules
  Future<void> fetchModules() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8000/modules'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        modules.value = data; // Update the observable list
      } else {
        // Handle error scenario (e.g., show a snackbar)
        Get.snackbar(
          "Error",
          "Failed to fetch modules: ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (error) {
      // Handle unexpected errors
      print("error is $error");
      Get.snackbar(
        "Error",
        "An unexpected error occurred: $error",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchModules(); // Call fetchModules on initialization
  }
}

