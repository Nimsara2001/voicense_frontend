import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voicense_frontend/app/models/module_model.dart';
import 'package:voicense_frontend/app/modules/note_set_of_module/widgets/topic.dart';
import 'package:voicense_frontend/app/widgets/note_view_card.dart';
import 'package:voicense_frontend/app/widgets/search_bar.dart';

import '../controllers/note_set_of_module_controller.dart';

class NoteSetOfModuleView extends GetView<NoteSetOfModuleController> {
  Module? module;
  NoteSetOfModuleView({this.module});

  @override
  Widget build(BuildContext context) {
    // NoteSetOfModuleController _controller = Get.put()
    NoteSetOfModuleController _controller = Get.put(NoteSetOfModuleController(module!));
    String title = module?.title.endsWith("_other") ?? false ? "Other Notes" : module?.title ?? "";
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SearchBarExplore(),
          Topic(title:title),
           Expanded(
              child: Obx(() => ListView.builder(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                itemCount: _controller.notes_of_module.length,
                itemBuilder: (context,index){
                  return RecentNoteCardView(note: _controller.notes_of_module[index]);
                },
              ),),
            )
          ],
        ),
      ),
    );
  }
}
