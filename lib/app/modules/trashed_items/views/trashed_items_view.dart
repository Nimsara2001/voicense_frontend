import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/trashed_items/controllers/trashed_items_controller.dart';
import 'package:voicense_frontend/app/modules/trashed_items/views/module_view.dart';
import 'package:voicense_frontend/app/modules/trashed_items/views/note_view.dart';

class TrashedItemsView extends GetView<TrashedItemsController> {
  @override
  Widget build(BuildContext context) {
    final TrashedItemsController controller = Get.put(TrashedItemsController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Text('Trashed Bin'),
          centerTitle: true,
        ),
        body:  Column(children: [TabBar(tabs: [
           Tab(
          icon:  Icon(Icons.document_scanner,
          color: Colors.blueAccent,),
          text: "Notes",),

          Tab(
            icon: Icon(Icons.folder,
            color: Colors.blueAccent,),
            text: "Modules",)
            ]),
            Expanded(
              child: TabBarView(children: [
                NoteView(),
                ModuleView()
              ],),
            )]
        ),
      ),
    );
  }
}
