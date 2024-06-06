import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/select_module/widgets/select_module_item.dart';

import '../controllers/select_module_controller.dart';

class SelectModuleView extends GetView<SelectModuleController> {
  final String? user_id;
  SelectModuleView({this.user_id});

  @override
  Widget build(BuildContext context) {
    final modulesController = Get.put(SelectModuleController(user_id: '66609a08f16ac1cbf31081d5'));
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amberAccent,
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
        child: ListView(
          children: [
            for (var module in modulesController.modules)
              SelectModuleItem(module_id:module['_id'],text: module['title']),
          ],
          // children:  [
          //   // for(Module item in modules)
          //   //    ModuleItem(module: item),
          //   // SelectModuleItem(text: "Object Oriented Programming"),
          //   // SelectModuleItem(text: "Software Engineering"),
          //   // SelectModuleItem(text: "Data Structure"),
          //   // SelectModuleItem(text: "Computer Network"),
          //   // SelectModuleItem(text: "Computer Graphics"),
          // ],
        ),
      ),
      // body: Obx(() => Container(
      //   margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      //   child: ListView.builder(
      //     itemCount: modulesController.modules.length,
      //     itemBuilder: (context, index) {
      //       final module = modulesController.modules[index];
      //       // Access and display module data here (e.g., name, description)
      //       // return ListTile(
      //       //   title: Text(module),
      //       //   // subtitle: Text(module['description'] ?? 'No description'),
      //       // );
      //       return SelectModuleItem(text: module);
      //     },
      //   ),
      // )),
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

