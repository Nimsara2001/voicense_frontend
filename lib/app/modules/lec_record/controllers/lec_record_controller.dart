
import 'package:get/get.dart';
import 'package:record/record.dart';


class LecRecordController extends GetxController {
  final RxBool isRecording = false.obs;
  late AudioRecorder audioRecord;

  String audioPath = '';


  void initState() {
    audioRecord = AudioRecorder();
  }


  @override
  void dispose() {
    audioRecord.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start(
            const RecordConfig(encoder: AudioEncoder.pcm16bits),
            path: 'aFullPath/myFile.m4a');
        isRecording.value = true;
      }
    } catch (e) {
      print('Error start recording');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();
      isRecording.value = false;
      audioPath = path!;
    }
    catch (e) {
      print('Error Stopping Record : $e');
    }
  }
}


