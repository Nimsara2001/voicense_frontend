import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupMenuBtnController extends GetxController {

  RxString value = ''.obs;

}
class PopupMenuBtn extends GetView<PopupMenuBtnController> {
  String note_id;
  PopupMenuBtn(this.note_id);

  @override
  Widget build(BuildContext context) {
    final PopupMenuBtnController _controllerX = Get.put(PopupMenuBtnController());

    return PopupMenuButton<String>(
                      onSelected: (String choice) {
                        
                        if (choice == 'Share') {
                          // Handle share functionality
                        } else if (choice == 'Trash') {
                          
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'Share',
                          child: ListTile(
                            leading: Icon(Icons.share),
                            title: Text('Share'),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Trash',
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Trash'),
                          ),
                        ),
                      ],
                    );
  }
}
