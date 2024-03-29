import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:get/get.dart';
import '../controllers/lec_record_controller.dart';
import 'package:intl/intl.dart';

Color myRgbColor = const Color(0xff21005D);

class LecRecordView extends GetView<LecRecordController> {
  // Add a variable to store the current timer value
  final _timer = Stopwatch();

  @override
  Widget build(BuildContext context) {
    Get.put(LecRecordController());

    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.only(bottom: 0, top: 30.0),
            // Adjust padding value as needed
            child: Text(
              _formatTime(),
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            )),
        centerTitle: false,
      ),
      body: Center(
        // This will center the children horizontally
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
              // Add padding around the container
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 350.0, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Color(0xffE6E0E9), // Change color as needed
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20.0), // Add a SizedBox for fixed space
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                // Display formatted timer value based on recording state
                _formatDuration(_timer.elapsed),
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto'),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 120.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Delete button
            FloatingActionButton(
              heroTag: 'delete',
              onPressed: () {
                // Add your onPressed code here for delete button
              },
              backgroundColor: myRgbColor,
              child: const Icon(Icons.delete, color: Colors.white),
              elevation: 0.0,
            ),
            const SizedBox(width: 75.0),
            // Record/Pause button (already styled with RecordPauseButton)
            RecordPauseButton(timer: _timer),
            const SizedBox(width: 75.0),
            // Stop button
            FloatingActionButton(
              heroTag: 'stop',
              onPressed: () {
                controller.stopRecording();
                _timer.reset(); // Reset timer when recording stops
              },
              backgroundColor: myRgbColor,
              elevation: 0.0,
              child: const Icon(Icons.stop, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to format the timer duration in MM:SS format
String _formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  final miliseconds = twoDigits(duration.inMilliseconds.remainder(60));
  return "$minutes:$seconds:$miliseconds";
}

String _formatTime() {
  final now = DateTime.now();
  final dayOfWeek = DateFormat('EEEE').format(now); // Get day of the week
  final formattedTime =
      DateFormat('hh:mm a').format(now); // 12-hour format with AM/PM
  return "$dayOfWeek, $formattedTime";
}



class RecordPauseButton extends StatelessWidget {
  final Stopwatch timer;

  const RecordPauseButton({required this.timer});

  @override
  Widget build(BuildContext context) {
    final LecRecordController controller = Get.find<LecRecordController>();

    return Obx(
      () => Transform.scale(
        scale: 2.0,
        child: FloatingActionButton(
          heroTag: 'record',
          onPressed: () {
            if (controller.isRecording.value) {
              controller.stopRecording();
              timer.stop(); // Stop the timer when recording pauses
            } else {
              controller.startRecording();
              timer.start(); // Start the timer when recording starts
            }
          },
          backgroundColor: myRgbColor,
          child: Icon(
              controller.isRecording.value
                  ? Icons.pause
                  : Icons.play_arrow_sharp,
              color: Colors.white),
          elevation: 0.0,
        ),
      ),
    );
  }
}
