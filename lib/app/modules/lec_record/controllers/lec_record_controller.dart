import 'package:get/get.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class LecRecordController extends GetxController {
  final FlutterSoundRecorder _recordingSession = FlutterSoundRecorder();
  final RxBool isRecording = false.obs;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void initialize() async {
    await _recordingSession.openAudioSession(
      focus: AudioFocus.requestFocusAndStopOthers,
      category: SessionCategory.playAndRecord,
      mode: SessionMode.modeDefault,
      device: AudioDevice.speaker,
    );
    await _recordingSession.setSubscriptionDuration(Duration(milliseconds: 10));
  }

  Future<void> startRecording(String pathToAudio) async {
    Directory directory = Directory(path.dirname(pathToAudio));
    if (!directory.existsSync()) {
      directory.createSync();
    }

    await _recordingSession.startRecorder(
      toFile: pathToAudio,
      codec: Codec.pcm16WAV,
    );
    isRecording.value = true; // Update isRecording state
  }

  Future<void> stopRecording() async {
    await _recordingSession.stopRecorder();
    isRecording.value = false; // Update isRecording state
  }

  @override
  void onClose() {
    _recordingSession.closeAudioSession();
    super.onClose();
  }
}
