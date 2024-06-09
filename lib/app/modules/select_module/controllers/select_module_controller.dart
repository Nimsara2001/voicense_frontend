import 'package:get/get.dart';
import 'package:voicense_frontend/app/util/base_client.dart';

import '../../../models/module_model.dart';

class SelectModuleController extends GetxController {
  final String user_id;
  SelectModuleController({required this.user_id});

  final RxList<Module> modules = RxList<Module>([]);

  Future<void> fetchModules() async {
    try {
      final response = await BaseClient().get('/module/all',parameters: {'user_id': user_id});

      if (response.statusCode == 200) {
        final modulesData = moduleFromJson(response.body);

        // Iterate over the modulesData list and rename the titles
        for (var module in modulesData) {
          if (module.title.endsWith('_other')) {
            module.title = 'Other Module';
          }
        }

        modules.assignAll(modulesData);

      } else {
        Get.snackbar(
          "Error",
          "Failed to fetch modules: ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (error) {
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
    fetchModules();
  }
}
