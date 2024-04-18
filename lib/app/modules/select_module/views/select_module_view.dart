import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/select_module/widgets/select_module_item.dart';

import '../controllers/select_module_controller.dart';

class SelectModuleView extends GetView<SelectModuleController> {
  @override
  Widget build(BuildContext context) {
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
        // actions: [Container(child: IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
        // padding: const EdgeInsets.all(5),
        // margin: const EdgeInsets.only(right: 20,bottom: 10),
        // decoration: BoxDecoration(
        //   color: const Color.fromARGB(255, 224, 98, 247),
        //   borderRadius: BorderRadius.circular(30)
        // ),)],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: ListView(
          children: const [
            // for(Module item in modules)
            //    ModuleItem(module: item),
            SelectModuleItem(text: "Object Oriented Programming"),
            SelectModuleItem(text: "Software Engineering"),
            SelectModuleItem(text: "Data Structure"),
            SelectModuleItem(text: "Computer Network"),
            SelectModuleItem(text: "Computer Graphics"),
          ],
        ),
      ),
    );
  }
}
