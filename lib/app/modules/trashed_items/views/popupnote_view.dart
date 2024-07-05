import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/trashed_items/controllers/popnote_controller.dart';

class PopupnoteView extends GetView {
  String? note_id;
  String? module_id;
  PopupnoteView({this.note_id, this.module_id});

  @override
  Widget build(BuildContext context) {
    final PopnoteController ControllerN = Get.put(PopnoteController(module_id: module_id, note_id: note_id));
    return PopupMenuButton<String>(
                      onSelected: (String choice) {
        
                        ControllerN.handleMenuSelection(context, choice);

                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'Restore',
                          child: ListTile(
                            leading: Icon(Icons.restore_from_trash),
                            title: Text('Restore'),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Delete',
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Delete'),
                          ),
                        ),
                      ],
                    );
    
      
}
}






