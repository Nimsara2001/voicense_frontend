
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart' as pdfLib;
// import '../../../models/note_model.dart';
// import '../controllers/lec_note_controller.dart';
// import 'package:markdown/markdown.dart' as md;

// class LecNoteView extends GetView<LecNoteController> {
//   Note? note;
//   LecNoteView({ this.note});

//   @override
//   Widget build(BuildContext context) {
//     final LecNoteController controller = Get.put(LecNoteController(note: note!));

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(note!.title),
//         actions: [
//           IconButton(
//             icon: Obx(() => Icon(controller.isPlaying.value ? Icons.pause : Icons.play_arrow)),
//             onPressed: () => controller.togglePlayPause(),
//           ),
//           IconButton(
//             icon: const Icon(Icons.stop),
//             onPressed: () => controller.stopSpeaking(),
//           ),
//           IconButton(
//             onPressed: () => _downloadAsPdf(context),
//             icon: const Icon(Icons.download),
//           ),
//         ],
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             controller.pauseSpeaking();
//             Get.back();
//           },
//         ),
//       ),
//       body: Markdown(
//         selectable: true,
//         data: note!.content,
//       ),
//     );
//   }

//   Future<void> _downloadAsPdf(BuildContext context) async {

//     var htmlContent = md.markdownToHtml(note!.content);

//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     final targetPath = appDocDir.path;
//     final targetFileName = "example-pdf";

//     final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(htmlContent, targetPath, targetFileName);
//   }
// }



// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html; // Import for web-specific operations
// import 'package:html_to_pdf/html_to_pdf.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:markdown/markdown.dart' as md;
import '../../../models/note_model.dart';
import '../controllers/lec_note_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class LecNoteView extends GetView<LecNoteController> {
  Note? note;
  LecNoteView({this.note});

  @override
  Widget build(BuildContext context) {
    final LecNoteController controller = Get.put(LecNoteController(note: note!));

    return Scaffold(
      appBar: AppBar(
        title: Text(note!.title),
        actions: [
          IconButton(
            icon: Obx(() => Icon(controller.isPlaying.value ? Icons.pause : Icons.play_arrow)),
            onPressed: () => controller.togglePlayPause(),
          ),
          IconButton(
            icon: const Icon(Icons.stop),
            onPressed: () => controller.stopSpeaking(),
          ),
          IconButton(
            onPressed: () => controller.downloadAsPdf(context),
            icon: const Icon(Icons.download),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.pauseSpeaking();
            Get.back();
          },
        ),
      ),
      body: Markdown(
        selectable: true,
        data: note!.content,
      ),
    );
  }
}

