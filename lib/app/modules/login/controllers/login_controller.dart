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




  RxList<Note> recent_notes = <Note>[].obs;
  RxList<Module> module_list = <Module>[].obs;

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
 
  Future<void> login(String username, String password) async {
    final response = await http.post(

      Uri.parse('http://192.168.8.100/auth/login'),

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
        // print(module.title);
        module_list.add(module);
      }

      print('---------------------------------------------');

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
