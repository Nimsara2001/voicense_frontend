import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voicense_frontend/app/modules/common_he/views/common_he_view.dart';

import '../../../models/module_model.dart';
import '../../../models/note_model.dart';
import '../../../models/user_model.dart';
import '../../../util/base_client.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController, passwordController;
  var isLoading = false.obs;
  String? username;
  String? password;
  String? serverUsernameError;
  String? serverPasswordError;



  late String user_id;
  RxList<Note> recent_notes = <Note>[].obs;
  RxList<Module> module_list = <Module>[].obs;
  RxList<Module> trashed_module_list = <Module>[].obs;
  RxList<Note> trashed_note_list = <Note>[].obs;
  List<Module> other_module_list = <Module>[];


  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateUsername(String value) {
    if (value.isEmpty) {
      return "Please enter your username";
    }
    if (serverUsernameError != null) {
      return serverUsernameError;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter your password";
    }
    if (serverPasswordError != null) {
      return serverPasswordError;
    }
    return null;
  }

  void checkLogin() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    isLoading.value = true;

    try {
      await login(usernameController.text, passwordController.text);
      
    } catch (e) {
      getSnack("error", "An error occurred during login");
    } finally {
      isLoading.value = false;
    }
  }

bool checkModule(String str) {
  final regExp = RegExp(r'_other', caseSensitive: false);
  return regExp.hasMatch(str);
}


  Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.8.101:8000/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      Get.snackbar(
        'Error',
        'An error occurred during authentication',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final responseData = jsonDecode(response.body);

    if (responseData['message'] == 'invalid') {
      // if (responseData['reason'] == 'invalid_username') {
      //   serverUsernameError = 'Invalid username';
      // }
      // if (responseData['reason'] == 'invalid_password') {
      //   serverPasswordError = 'Invalid password';
      // }
      getSnack("error", "Invalid username or password");
    }

    if (responseData['message'] == 'success') {
      final loginRespond = User.fromJson(responseData);
      user_id=loginRespond.user.id;
      print('token ${loginRespond.token.accessToken}');

      storeToken(loginRespond.token.accessToken, loginRespond.user.id);

      if (loginRespond.user.userType == 'Student') {
        Get.to(() => CommonHeView(userType: 'Student', user_id: loginRespond.user.id));
      }
      if (loginRespond.user.userType == 'Lecturer') {
        Get.to(() => CommonHeView(userType: 'Lecturer', user_id: loginRespond.user.id));
      }


      // Example of use of the BaseClient class
      var response = await BaseClient().get('/module/all', parameters: {'user_id': loginRespond.user.id});

      var moduleList = moduleFromJson(response.body);
      for (var module in moduleList) {
        print(module.title);
         if(checkModule(module.title)){
            other_module_list.add(module);
            // print(other_module_list[0].title + '-------------------');
         }
         else{
          module_list.add(module);}
      }

      // print('-------------------------------------------------------------------------');

      var trashed_modules_response = await BaseClient().get('/module/trashed', parameters: {'user_id': loginRespond.user.id});
      var trashed_modules = moduleFromJson(trashed_modules_response.body);
      for (var module in trashed_modules) {
         trashed_module_list.add(module);
      }

      // var response2 = await BaseClient().post('/module/${moduleList[2].id}/notes',parameters: null);

      // var noteList = noteFromJson(response2.body);
      // for (var note in noteList) {
      //   print(note.content);
      // }

      var response_recentNotes = await BaseClient().get('/note/recent',parameters: {'user_id':loginRespond.user.id});
      if(response_recentNotes.statusCode==200) {
        var recent_noteList = noteFromJson(response_recentNotes.body);
        for (var note in recent_noteList) {
          recent_notes.add(note);
        }
      }

      // print("beforeeeeeeeeee");
      // var trashed_notes_response = await BaseClient().get('/note/trashed', parameters: {'user_id': loginRespond.user.id});
      // print("code isssssssssssssssssss   $trashed_notes_response.statusCode");
      // var trashed_notes = noteFromJson(trashed_notes_response.body);
      // print(trashed_notes);
      // for (var note in trashed_notes) {
      //    trashed_note_list.add(note);
      // }
      // print("afterrrrrrrrrrr");

    //   var trashedNotesResponse = await BaseClient().get('/note/trashed', parameters: {'user_id': loginRespond.user.id});
    //   if (trashedNotesResponse != null) {
    //   print("HTTP Status Code: ${trashedNotesResponse.statusCode}");
    //   var trashedNotes = noteFromJson(trashedNotesResponse.body);  // Adjust this function according to your implementation
    //   print(trashedNotes);
    //   for (var note in trashedNotes) {
    //     trashed_note_list.add(note);  // Ensure `trashedNoteList` is defined and accessible
    //   }
    // } else {
    //   Get.snackbar('Error', 'Failed to fetch trashed notes', snackPosition: SnackPosition.BOTTOM);
    // }

      final responseo = await BaseClient().get('/note/trashed', parameters: {'user_id': loginRespond.user.id});
      if (responseo.statusCode == 200) {
        var trashedNotes = noteFromJson(responseo.body);  // Adjust this function according to your implementation
        trashed_note_list.assignAll(trashedNotes);  // Assuming `trashedNoteList` is defined as an observable list
      } else {
        print('Failed to fetch trashed notes: ${responseo.statusCode}');
        Get.snackbar('Error', 'Failed to fetch trashed notes', snackPosition: SnackPosition.BOTTOM);
      }

    }
  }

  void storeToken(String token,String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('user_id', userId);
  }

  void getSnack(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
