
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



import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html; // Import for web-specific operations

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:html_to_pdf/html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';
import '../../../models/note_model.dart';
import '../controllers/lec_note_controller.dart';
import 'package:markdown/markdown.dart' as md;

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
            onPressed: () => _downloadAsPdf(context),
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

  Future<void> _downloadAsPdf(BuildContext context) async {
    var htmlContent = md.markdownToHtml(note!.content);
    print(htmlContent);

       Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = appDocDir.path;
    final targetFileName = "example-pdf";

    final generatedPdfFile = await HtmlToPdf.convertFromHtmlContent(
      htmlContent: htmlContent,
      printPdfConfiguration: PrintPdfConfiguration(
        targetDirectory: targetPath,
        targetName: targetFileName,
        printSize: PrintSize.A4,
        printOrientation: PrintOrientation.Landscape,
      ),
    );
    
  }
}


// import 'dart:convert';
// import 'dart:html' as html;
// import 'dart:io' if (dart.library.html) 'dart:html' as html; // Import for web-specific operations
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:get/get.dart';
// import 'package:html_to_pdf/html_to_pdf.dart';
// import 'package:path_provider/path_provider.dart';
// import '../../../models/note_model.dart';
// import '../controllers/lec_note_controller.dart';
// import 'package:markdown/markdown.dart' as md;
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// class LecNoteView extends GetView<LecNoteController> {
//   Note? note;
//   LecNoteView({this.note});

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
//     print(htmlContent);

//     if (kIsWeb) {
//       // Web-specific code
//       final pdf = pw.Document();
//       // final font = await PdfGoogleFonts.nunitoRegular();

//       pdf.addPage(
//         pw.Page(
//           build: (context) {
//             return pw.Html(
//               data: htmlContent,
//               customStylesBuilder: (element) {
//                 return {
//                   // 'font-family': font.getFontName(),
//                   'font-size': '12px',
//                 };
//               },
//             );
//           },
//         ),
//       );

//       final bytes = await pdf.save();

//       // Create a Blob from the PDF bytes
//       final blob = html.Blob([bytes], 'application/pdf');

//       // Create a link element and click it to trigger the download
//       final url = html.Url.createObjectUrlFromBlob(blob);
//       final anchor = html.AnchorElement(href: url)
//         ..setAttribute("download", "example-pdf.pdf")
//         ..click();
//       html.Url.revokeObjectUrl(url);
//     } else {
//       // Mobile-specific code
//       Directory appDocDir = await getApplicationDocumentsDirectory();
//       final targetPath = appDocDir.path;
//       final targetFileName = "example-pdf";

//       final generatedPdfFile = await HtmlToPdf.convertFromHtmlContent(
//         htmlContent: htmlContent,
//         printPdfConfiguration: PrintPdfConfiguration(
//           targetDirectory: targetPath,
//           targetName: targetFileName,
//           printSize: PrintSize.A4,
//           printOrientation: PrintOrientation.Landscape,
//         ),
//       );

//       // If needed, you can use a method to show or open the PDF on mobile devices
//       // Example: OpenFile.open(generatedPdfFile.path);
//     }
//   }
// }

