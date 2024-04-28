// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// import '../controllers/lec_note_controller.dart';

// class LecNoteView extends GetView<LecNoteController> {
//   final flutterTts = FlutterTts(); // Initialize FlutterTts instance

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Structure'),
//         // centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.play_arrow),
//             onPressed: () => _speakMarkdown(), // Call _speakMarkdown on press
//           ),
//            IconButton(
//             icon: Icon(Icons.pause),
//             onPressed: () => _pauseSpeaking(), // Call _speakMarkdown on press
//           ),
//            IconButton(
//             icon: Icon(Icons.stop),
//             onPressed: () => _stopSpeaking(), // Call _speakMarkdown on press
//           ),
//         ],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: SizedBox.expand(
//         child: FutureBuilder<String>(
//           future: _fetchMarkdownData(), // Can potentially be removed if data is loaded elsewhere
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final markdownData = snapshot.data!;
//               return Markdown(selectable: true, data: markdownData);
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             }
//             return Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
//   }

//   Future<String> _fetchMarkdownData() async {
//     final response = await rootBundle.loadString('assets/lecture_notes.md');
//     return response;
//   }

//   void _speakMarkdown() async {
//     final markdownData = await _fetchMarkdownData();

//     if (markdownData == null) {
//      // print('Failed to fetch markdown data');
//       return;
//     }

//     // Remove symbols from markdown data
//     final filteredMarkdown = _removeSymbols(markdownData);

//     // Speak the filtered markdown text
//     //  await flutterTts.awaitSpeakCompletion();
//     await flutterTts.setPitch(1.0); // Adjust pitch as desired (optional)
//     await flutterTts.setSpeechRate(0.5); // Adjust speech rate as desired (optional)
//     await flutterTts.speak(filteredMarkdown);
//   }

//   String _removeSymbols(String text) {
//     final regex = RegExp(r'[^\w\s]'); // Matches characters except letters, numbers, and whitespace
//     return text.replaceAll(regex, '');
//   }

//   void _pauseSpeaking() async {
//     await flutterTts.pause();
//   }

//   void _stopSpeaking() async {
//     await flutterTts.stop();
//   }
// }


import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../controllers/lec_note_controller.dart';

class LecNoteView extends GetView<LecNoteController> {
  final flutterTts = FlutterTts(); // Initialize FlutterTts instance
  
  @override
  Widget build(BuildContext context) {
    final LecNoteController controller = Get.put(LecNoteController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Structure'),
        actions: [
          IconButton(
            icon: Obx(() => Icon(controller.isPlaying.value ? Icons.pause : Icons.play_arrow)),
            onPressed: () => _togglePlayPause(),
          ),
          IconButton(
            icon: const Icon(Icons.stop),
            onPressed: () => _stopSpeaking(),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SizedBox.expand(
        child: FutureBuilder<String>(
          future: _fetchMarkdownData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final markdownData = snapshot.data!;
              return Markdown(selectable: true, data: markdownData);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Future<String> _fetchMarkdownData() async {
    final response = await rootBundle.loadString('assets/lecture_notes.md');
    return response;
  }

  void _togglePlayPause() async {
    if (controller.isPlaying.value) {
      _pauseSpeaking();
    } else {
      _speakMarkdown();
    }
    controller.isPlaying.value = !controller.isPlaying.value; // Update playback state
  }

  void _speakMarkdown() async {
    final markdownData = await _fetchMarkdownData();

    // ignore: unnecessary_null_comparison
    if (markdownData == null) {
      return;
    }

    final filteredMarkdown = _removeSymbols(markdownData);

    await flutterTts.setPitch(1.0); // Adjust pitch as desired (optional)
    await flutterTts.setSpeechRate(0.5); // Adjust speech rate as desired (optional)
    await flutterTts.speak(filteredMarkdown);
  }

  String _removeSymbols(String text) {
    final regex = RegExp(r'[^\w\s]'); // Matches characters except letters, numbers, and whitespace
    return text.replaceAll(regex, '');
  }

  void _pauseSpeaking() async {
    await flutterTts.pause();
  }

  void _stopSpeaking() async {
    await flutterTts.stop();
    controller.isPlaying.value = false; // Reset playback state
  }
}
