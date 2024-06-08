import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ModulePopupMenuBtnController extends GetxController {
  String module_id;
  ModulePopupMenuBtnController(this.module_id);

 Future<void> sendRequest(String action) async {
   try{
    // Depending on the action, you can modify the request
    if (action == 'share') {
      final String url = 'http://192.168.8.100:8000/note/share/$module_id';
      // Send a request to share the item
      final response = await http.post(
        Uri.parse(url),
        body: {'action': 'share'},
      );

      if (response.statusCode == 200) {
        print('Item shared successfully');
        //put snack messege 
      } else {
        print('Failed to share item');
        //put snack messege 
         Get.snackbar('Error', 'Error during trash: ${response.body}',
          snackPosition: SnackPosition.BOTTOM);
      }
    } else if (action == 'trash') {
      // Send a request to delete the item
      final String url = 'http://192.168.8.100:8000/note/trash/$module_id';
      final response = await http.put(
        Uri.parse(url),
        body: {'is_deleted': 'true'},
      );

      if (response.statusCode == 200) {
        print('Item deleted successfully');
        //put snack messege 
      } else {
        print('Failed to delete item');
        //put snack messege 
         Get.snackbar('Error', 'Error during trash: ${response.body}',
          snackPosition: SnackPosition.BOTTOM);
      }
    }

    // else if (action == 'edit') {
    //   // Send a request to edit the item
    //   final String url = 'http://192.168.8.100:8000/note/trash/$module_id';
    //   final response = await http.post(
    //     Uri.parse(url),
    //     body: {'action': 'edit'},
    //   );

    //   if (response.statusCode == 200) {
    //     print('Item deleted successfully');
    //     //put snack messege 
    //   } else {
    //     print('Failed to delete item');
    //     //put snack messege 
    //      Get.snackbar('Error', 'Error during trash: ${response.body}',
    //       snackPosition: SnackPosition.BOTTOM);
    //   }
    // }
  }
  catch(e){
       print('Error : $e');
       Get.snackbar('Error', 'Error during proccessed: $e',
          snackPosition: SnackPosition.BOTTOM);
  }
 }

  void _handleMenuSelection(BuildContext context, String choice) {
    if (choice == 'Share') {
      _showAlertDialog(context, 'Share', 'Do you want to share this module?');
    } else if (choice == 'Trash') {
      _showAlertDialog(context, 'Trash', 'Do you want to delete this module?');
    }
    else if (choice == 'Edit') {
      _showAlertDialog(context, 'Edit', 'Do you want to edit this module?');
    }
  }


  Future<void> _showAlertDialog(BuildContext context, String title, String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                 Get.back();
                await sendRequest(title.toLowerCase());
               
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
  
}







class ModulePopupMenuBtn extends GetView<ModulePopupMenuBtnController> {
  final String module_id;
  ModulePopupMenuBtn(this.module_id);

  @override
  Widget build(BuildContext context) {
    final ModulePopupMenuBtnController _controllermod = Get.put(ModulePopupMenuBtnController(module_id));

    return PopupMenuButton<String>(
                      onSelected: (String choice) {
                        // Handle share functionality
                        _controllermod._handleMenuSelection(context, choice);

                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Share',
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0), // Minimize padding
                        leading: Icon(Icons.share, size: 20), // Adjust icon size
                        title: Text('Share', style: TextStyle(fontSize: 14)), // Adjust text size
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Edit',
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0), // Minimize padding
                        leading: Icon(Icons.edit, size: 20), // Adjust icon size
                        title: Text('Edit', style: TextStyle(fontSize: 14)), // Adjust text size
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Trash',
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0), // Minimize padding
                        leading: Icon(Icons.delete, size: 20), // Adjust icon size
                        title: Text('Trash', style: TextStyle(fontSize: 14)), // Adjust text size
                      ),
                    ),
                  ],
                    );
  }
}
