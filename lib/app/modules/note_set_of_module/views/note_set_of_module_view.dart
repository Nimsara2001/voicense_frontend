import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/note_set_of_module/widgets/topic.dart';
import 'package:voicense_frontend/app/widgets/note_view_card.dart';
import 'package:voicense_frontend/app/widgets/search_bar.dart';

import '../controllers/note_set_of_module_controller.dart';

class NoteSetOfModuleView extends GetView<NoteSetOfModuleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarExplore(),
           const Topic(title: "Module name"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                children: const [
                  RecentNoteViewCard(title: "title",createdDate: "date",twoLines: "two line text",),
                  RecentNoteViewCard(title: "title",createdDate: "date",twoLines: "two line text",),
                  RecentNoteViewCard(title: "title",createdDate: "date",twoLines: "two line text",),
                  RecentNoteViewCard(title: "title",createdDate: "date",twoLines: "two line text",),
                  RecentNoteViewCard(title: "title",createdDate: "date",twoLines: "two line text",),
                  RecentNoteViewCard(title: "title",createdDate: "date",twoLines: "two line text",),
                  // RecentNoteViewCard(),
                  // RecentNoteViewCard(),
                  // RecentNoteViewCard(),
                  // RecentNoteViewCard(),
                  // RecentNoteViewCard(),
                  // RecentNoteViewCard(),
                  // RecentNoteViewCard(),
                  // RecentNoteViewCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
