
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../../../models/note_model.dart';
import '../../../util/base_client.dart';

class LecNoteController extends GetxController {
  //TODO: Implement LecNoteController

  //static const x = 0;
  RxBool isPlaying = false.obs; 
  // Flag to track playback state
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

  Future<void> downloadPdf(String noteId) async {
    try {
      var response = await BaseClient().get('/note/download/$noteId');

      if (response.statusCode == 200) {
        // Get the directory to save the PDF
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/$noteId.pdf';

        // Write the PDF file
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        print('Download successful, file saved to $filePath');
      } else {
        print('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }
}
