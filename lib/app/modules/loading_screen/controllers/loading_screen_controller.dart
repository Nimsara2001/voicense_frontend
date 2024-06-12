import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import '../../../models/note_model.dart';
import '../../../util/base_client.dart';
import 'package:http/http.dart' as http;


class LoadingScreenController extends GetxController {
  // Observable variable to manage loading state
  var isLoading = true.obs;
  final String path = Get.arguments['recordPath'];
  final String userId = Get.arguments['userId'];
  final String moduleId = Get.arguments['moduleId'];
  var noteId;

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    print('LoadingScreenController: $path');
    print('LoadingScreenController: $userId');
    print('LoadingScreenController: $moduleId');

    await callUploadRecord(userId, moduleId, path);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;


  // Function to start loading
  void startLoading() {
    isLoading.value = true;
  }


  // Function to stop loading
  void stopLoading() {
    isLoading.value = false;
  }

  // Function to toggle loading state
  void toggleLoading() {
    isLoading.value = !isLoading.value;
  }

  // Function to simulate a network request or a long-running task
  void simulateLoading({int durationInSeconds = 3}) {
    startLoading();
    Future.delayed(Duration(seconds: durationInSeconds), () {
      stopLoading();
    });
  }

  Future<void> callUploadRecord(String userId,String moduleId, String recordPath) async{
    File file = File(recordPath);
    var fileExists = await file.exists();
    if (fileExists) {
      print('File is correctly created and exists at the path: $recordPath');
    } else {
      print('File does not exist at the path: $recordPath');
    }
    await uploadRecord(userId, moduleId, file);
  }


  Future<void> uploadRecord(String userId, String moduleId,File file) async {
    try {
      var token = await getToken();
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/record/upload?user_id=$userId&module_id=$moduleId'));
      request.headers.addAll(<String, String>{
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token',
      });
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

      print(token);
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseJson = jsonDecode(await response.stream.bytesToString());
        if(responseJson['message']=='success') {
          isLoading.value = false;
          noteId=responseJson['note_id'];
          if (noteId == null) {
            throw Exception('noteId is null');
          }
        }
      }
    } catch (e) {
      print('Failed to upload record: $e');

    }
  }

  Future<Note> getNote() async{
      var res=await BaseClient().get("/note/$noteId", parameters: null);
      var note=Note.fromJson(jsonDecode(res.body));
      return note;
  }
}
