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
  final String user_id;
  SelectModuleController({required this.user_id});
  // Observable list to store fetched modules
  final RxList<dynamic> modules = RxList<dynamic>([]);

  // Function to fetch modules
  Future<void> fetchModules() async {
    try {
      final response = await http.get(Uri.http('192.168.8.101:8000', '/module/all', {'user_id': user_id}));
      if (response.statusCode == 200) {
        // print("gotttttttt");
        print(response.body);
        final data = jsonDecode(response.body);
        // print(data);
        modules.value = RxList<dynamic>.from(data);// Update the observable list
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

