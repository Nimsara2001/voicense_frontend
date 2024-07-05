import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/trashed_items/controllers/popmodule_controller.dart';

class PopupmoduleView extends GetView {
  String? user_id;
  String? module_id;
  PopupmoduleView({this.user_id, this.module_id});

  @override
  Widget build(BuildContext context) {
    final PopmoduleController controllerM = Get.put(PopmoduleController(user_id: user_id, module_id: module_id));
    return PopupMenuButton<String>(
                      onSelected: (String choice) {
                        // Handle share functionality
                        controllerM.handleMenuSelection(context, choice);

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
