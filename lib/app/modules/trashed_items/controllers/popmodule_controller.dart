import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopmoduleController extends GetxController {
  String? user_id;
  String? module_id;
  PopmoduleController({this.user_id, this.module_id});


    
 Future<void> sendRequest(String action) async {
   try{
         if (action == 'restore') {
      final String url = 'http://192.168.8.101:8000/module/restore/$module_id';
      // Send a request to restore the item
      final response = await http.post(
        Uri.parse(url),
        body: {'module_id': module_id!},
      );

      if (response.statusCode == 200) {
        print('Item restored successfully');
        //put snack messege 
      } else {
        print('Failed to restore item');
        //put snack messege 
         Get.snackbar('Error', 'Error during restoring: ${response.body}',
          snackPosition: SnackPosition.BOTTOM);
      }
    } else if (action == 'delete') {
      // Send a request to delete the item
      final String url = 'http://192.168.8.101:8000/module/delete';
      // final response = await http.post(
      //   Uri.parse(url),
      //   body: {'user_id':user_id!,'module_id': module_id!},
      // );
      final response = await http.post(
                       Uri.parse(url),
                       headers: {'Content-Type': 'application/json',},body: jsonEncode({'user_id': user_id!, 'module_id': module_id!}),);

      if (response.statusCode == 200) {
        print('Item deleted successfully');
        //put snack messege 
      } else {
        print('Failed to delete item');
        //put snack messege 
         Get.snackbar('Error', 'Error during deletion: ${response.body}',
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

  void handleMenuSelection(BuildContext context, String choice) {
    if (choice == 'Restore') {
      _showAlertDialog(context, 'Restore', 'Do you want to restore this module');
    } else if (choice == 'Delete') {
      _showAlertDialog(context, 'Delete', 'Do you want to delete this module permanently?');
    }
  }
  
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
