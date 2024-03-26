import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/lec_record_controller.dart';

class LecRecordView extends GetView<LecRecordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lec Record View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LecRecordView is working FINE',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Delete button
          FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here for delete button
            },
            child: const Icon(Icons.delete),
          ),
          const SizedBox(width: 30), // Adjust the distance between buttons
          // Record/Pause button
          RecordPauseButton(),
          const SizedBox(width: 30), // Adjust the distance between buttons
          // Stop button
          FloatingActionButton(
            onPressed: () {
              controller.stopRecording();
            },
            child: const Icon(Icons.stop),
          ),
        ],
      ),
    );
  }
}

class RecordPauseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LecRecordController controller = Get.find<LecRecordController>();

    return Obx(
          () => Transform.scale(
        scale: 1.5,
        child: FloatingActionButton(
          onPressed: () {
            if (controller.isRecording.value) {
              controller.stopRecording();
            } else {
              controller.startRecording('/sdcard/Download/temp.wav');
            }
          },
          child: Icon(controller.isRecording.value ? Icons.pause : Icons.mic),
        ),
      ),
    );
  }
}
