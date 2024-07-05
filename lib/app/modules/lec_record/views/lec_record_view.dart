import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';
import 'package:record/record.dart';
import 'package:voicense_frontend/app/modules/lec_record/controllers/lec_record_controller.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voicense_frontend/app/modules/lec_record/controllers/lec_record_file_helper.dart';
import '../views/play_pause_button.dart';
import 'audio_waves_view.dart';
import 'package:voicense_frontend/app/util/theme.dart';

Color myRgbColor = myPrimaryColor;

class AudioRecorderView extends StatelessWidget {
  const AudioRecorderView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AudioRecorderController>(
      create: (context) => AudioRecorderController(
        AudioRecorderFileHelper(),
            (message) {
          print(message);
        },
      ),
      child: const _AudioRecorderViewBody(),
    );
  }
}

class _AudioRecorderViewBody extends StatefulWidget {
  const _AudioRecorderViewBody({super.key});

  @override
  State<_AudioRecorderViewBody> createState() => _AudioRecorderViewBodyState();
}
class _AudioRecorderViewBodyState extends State<_AudioRecorderViewBody> {
  late final AudioRecorderController audioRecorderService;
  DateTime createdTime = DateTime.now();

  @override
  void initState() {
    audioRecorderService = context.read<AudioRecorderController>();
    audioRecorderService.start();
    createdTime = DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    audioRecorderService.dispose();
    super.dispose();
  }

  Future<bool> _showConfirmationDialog(BuildContext context, String message) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    ) ?? false; // if null (dialog dismissed), return false
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 0, top: 30.0),
          child: Text(
            DateFormat('EEEE hh:mm a').format(createdTime),
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
          ),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 350.0,
                decoration: BoxDecoration(
                  color: Color(0xffE6E0E9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const AudioWavesView(),
              ),
            ),
            SizedBox(height: 10.0), // Add some space between container and duration timer
            const _TimerText(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () async {
                bool confirmed = await _showConfirmationDialog(context, 'Are you sure you want to delete this recording?');
                if (confirmed) {
                  context.read<AudioRecorderController>().stop((voiceNoteModel) {
                    if (voiceNoteModel == null) {
                      Navigator.pop(context);
                    } else {
                      context.read<AudioRecorderController>().delete(voiceNoteModel.path).then((value) {
                        Navigator.pop(context);  // Remove the current page from the stack
                        Get.toNamed('/lec_home'); // Navigate to the 'common-he' page
                      });
                    }
                  });
                }
              },
              backgroundColor: myPrimaryColor,
              child: const Icon(Icons.delete, color: Colors.white),
              elevation: 0.0,
            ),

            const SizedBox(width: 20.0),
            StreamBuilder(
              stream: audioRecorderService.recordStateStream,
              builder: (context, snapshot) {
                return PlayPauseButton(
                  isPlaying: snapshot.data == RecordState.record,
                  onTap: () {
                    if (snapshot.data == RecordState.pause) {
                      audioRecorderService.resume();
                    } else {
                      audioRecorderService.pause();
                    }
                  },
                );
              },
            ),
            const SizedBox(width: 20.0),
            FloatingActionButton(
              onPressed: () async {
                bool confirmed = await _showConfirmationDialog(context, 'Are you sure you want to stop the recording?');
                if (confirmed) {
                  context.read<AudioRecorderController>().stop((recordingModel) {
                    Navigator.pop(context, recordingModel);
                  });
                }
              },
              backgroundColor: myPrimaryColor,
              elevation: 0.0,
              child: const Icon(Icons.stop, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}



class _TimerText extends StatelessWidget {

  const _TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all (2),
      child: StreamBuilder(
        initialData: 0,
        stream: context
            .read<AudioRecorderController>()
            .recordDurationOutput,
        builder: (context, snapshot) {
          final durationInSec = snapshot.data ?? 0;
          final int minutes = durationInSec ~/ 60;
          final int seconds = durationInSec % 60;
          return Text(
            '${minutes.toString().padLeft(2, '0')} : ${seconds.toString()
                .padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          );
        },
      ),
    );
  }


}