import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopupMenuBtnController extends GetxController {
  String note_id;
  PopupMenuBtnController(this.note_id);

 Future<void> sendRequest(String action) async {
   try{
    // Depending on the action, you can modify the request
    if (action == 'share') {
      final String url = 'http://192.168.8.100:8000/note/share/$note_id';
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
      }
    } else if (action == 'trash') {
      // Send a request to delete the item
      final String url = 'http://192.168.8.100:8000/note/trash/$note_id';
      final response = await http.post(
        Uri.parse(url),
        body: {'action': 'trash'},
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
  }
  catch(e){
       print('Error : $e');
      Get.snackbar('Error', 'Error during proccessed: $e',
          snackPosition: SnackPosition.BOTTOM);
  }
 }

  void _handleMenuSelection(BuildContext context, String choice) {
    if (choice == 'Share') {
      _showAlertDialog(context, 'Share', 'Do you want to share this item?');
    } else if (choice == 'Trash') {
      _showAlertDialog(context, 'Trash', 'Do you want to delete this item?');
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







class PopupMenuBtn extends GetView<PopupMenuBtnController> {
  String note_id;
  PopupMenuBtn(this.note_id);

  @override
  Widget build(BuildContext context) {
    final PopupMenuBtnController _controllerX = Get.put(PopupMenuBtnController(note_id));

    return PopupMenuButton<String>(
                      onSelected: (String choice) {
                        // Handle share functionality
                        _controllerX._handleMenuSelection(context, choice);

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
