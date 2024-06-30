
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../../models/note_model.dart';

class LecNoteController extends GetxController {
  Note? note;
  LecNoteController({this.note});

  final flutterTts = FlutterTts();
  RxBool isPlaying = false.obs; 
  // Flag to track playback state

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

    void togglePlayPause() async {
    if (isPlaying.value) {
      pauseSpeaking();
    } else {
      speakMarkdown();
    }
    isPlaying.value = !isPlaying.value; // Update playback state
  }

  void speakMarkdown() async {
    // final markdownData = await _fetchMarkdownData();
    final markdownData = note!.content;

    // ignore: unnecessary_null_comparison
    if (markdownData == null) {
      return;
    }

    final filteredMarkdown = removeSymbols(markdownData);

    await flutterTts.setPitch(1.0); // Adjust pitch as desired (optional)
    await flutterTts.setSpeechRate(0.5); // Adjust speech rate as desired (optional)
    await flutterTts.speak(filteredMarkdown);
  }

  String removeSymbols(String text) {
    final regex = RegExp(r'[^\w\s]'); // Matches characters except letters, numbers, and whitespace
    return text.replaceAll(regex, '');
  }

  void pauseSpeaking() async {
    await flutterTts.pause();
  }

  void stopSpeaking() async {
    await flutterTts.stop();
    isPlaying.value = false; // Reset playback state
  }

}
