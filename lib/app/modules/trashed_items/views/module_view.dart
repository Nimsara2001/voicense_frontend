import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/login/controllers/login_controller.dart';
import 'package:voicense_frontend/app/modules/trashed_items/views/popupmodule_view.dart';

class ModuleView extends GetView {
  final LoginController MControllerFromlogin = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: ((BuildContext context, index) {
         return ListTile(
           title: Text(MControllerFromlogin.trashed_module_list[index].title),
           leading: Icon(Icons.folder),
           trailing: PopupmoduleView(user_id: MControllerFromlogin.user_id,module_id: MControllerFromlogin.trashed_module_list[index].id,),
         );
      }),
       separatorBuilder: (BuildContext context, index) {
         return Divider();
       },
       itemCount: MControllerFromlogin.trashed_module_list.length),
    );
  }
}
