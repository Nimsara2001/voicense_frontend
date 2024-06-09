import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/select_module/widgets/select_module_item.dart';

import '../controllers/select_module_controller.dart';

class SelectModuleView extends GetView<SelectModuleController> {
  final String? user_id;
  SelectModuleView({super.key, this.user_id});

  @override
  Widget build(BuildContext context) {
    print("user_id...." + user_id!);

    final modulesController = Get.put(SelectModuleController(user_id: user_id!));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Select Module",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Obx(() => ListView(
          children: modulesController.modules.map((module) => SelectModuleItem(module_id: module.id,text: module.title)).toList(),
        )),
      ),
    );
  }
}

// class SelectModuleView extends StatelessWidget {
//   final modulesController = Get.put(SelectModuleController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Modules'),
//       ),
//       body: Obx(() => ListView.builder(
//         itemCount: modulesController.modules.length,
//         itemBuilder: (context, index) {
//           final module = modulesController.modules[index];
//           // Access and display module data here (e.g., name, description)
//           return ListTile(
//             title: Text(module),
//             // subtitle: Text(module['description'] ?? 'No description'),
//           );
//         },
//       )),
//     );
//   }
// }

