import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/explore/controllers/explore_controller.dart';
import 'package:http/http.dart' as http;

class ModuleLabelBarController extends GetxController{

   Future<void> _showInputDialog(BuildContext context) async {
    final TextEditingController textController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button to close dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New module'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to add a new module?'),
                TextField(
                  controller: textController,
                  decoration: InputDecoration(hintText: "Module title"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Get.back(); // dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () async {
                final text = textController.text;
                if (text.isNotEmpty) {
                  await _sendDataToBackend(text);
                  Get.back(); // dismiss the dialog
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _sendDataToBackend(String text) async {
    final url = Uri.parse('http://192.168.8.100:8000/module/add');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': text}),
    );

    if (response.statusCode == 200) {
      print('Success: ${response.body}');
      Get.snackbar("successfull", "New module created",
      );
    } else {
      print('Error: ${response.statusCode}');
       Get.snackbar('Error', 'Not created: ${response.body}',
            snackPosition: SnackPosition.BOTTOM);
    }
  }
}


class ModuleLabelBarView extends GetView {
  @override
  Widget build(BuildContext context) {
   
   ExploreController _controller=Get.find<ExploreController>();

    return Container(
      margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Modules",
            style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold),
          ),
       _controller.userType=='Lecturer'?_AddModule(context):Container(),
        ],
      ),
    );
  }

Widget _AddModule(BuildContext context){
    final ModuleLabelBarController _controllerModBar = Get.put(ModuleLabelBarController());
    return IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _controllerModBar._showInputDialog(context);
            },
          );
  }

}

