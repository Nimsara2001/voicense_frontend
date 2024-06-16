import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/login/controllers/login_controller.dart';
import 'package:voicense_frontend/app/modules/trashed_items/views/popupnote_view.dart';

class NoteView extends GetView {
  @override
  Widget build(BuildContext context) {
    final LoginController NControllerFromlogin = Get.find<LoginController>();
    return Scaffold(
      body: ListView.separated(
        itemBuilder: ((BuildContext context, index) {
         return ListTile(
           title: Text(NControllerFromlogin.trashed_note_list[index].title),
           subtitle: Text(NControllerFromlogin.trashed_note_list[index].description),
           leading: Icon(Icons.note),
           trailing: PopupnoteView(note_id: NControllerFromlogin.trashed_note_list[index].id,module_id: NControllerFromlogin.trashed_note_list[index].module_id,),
         );
      }),
       separatorBuilder: (BuildContext context, index) {
         return Divider();
       },
       itemCount: NControllerFromlogin.trashed_note_list.length),
    );
  }
}
