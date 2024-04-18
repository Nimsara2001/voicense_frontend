import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:get/get.dart';
import 'package:record/record.dart';
import 'package:voicense_frontend/app/modules/lec_record/controllers/lec_record_controller.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voicense_frontend/app/modules/lec_record/controllers/lec_record_file_helper.dart';
import '../views/play_pause_button.dart';
import 'audio_waves_view.dart';

Color myRgbColor = const Color(0xff21005D);

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
  DateTime createdTime=DateTime.now();

  @override
  void initState() {
    audioRecorderService = context.read<AudioRecorderController>();
    audioRecorderService.start();
    createdTime=DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    audioRecorderService.dispose();
    super.dispose();
  }

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
              onPressed: () {
                context.read<AudioRecorderController>().stop((voiceNoteModel){
                  if(voiceNoteModel == null){
                    Navigator.pop(context);
                  }else{
                    context.read<AudioRecorderController>().delete(voiceNoteModel.path).then((value){
                      Navigator.pop(context);
                    });
                  }
                });
              },
              backgroundColor: myRgbColor,
              child: const Icon(Icons.delete, color: Colors.white),
              elevation: 0.0,
            ),
            const SizedBox(width: 20.0),
            // Record/Pause button (already styled with RecordPauseButton)
            StreamBuilder(
              stream: audioRecorderService.recordStateStream,
              builder: (context, snapshot) {
                return PlayPauseButton(
                  isPlaying: snapshot.data == RecordState.record,
                  onTap: () {
                    if(snapshot.data == RecordState.pause){
                      audioRecorderService.resume();
                    }else{
                      audioRecorderService.pause();
                    }
                  },
                );
              },
            ),
            const SizedBox(width: 20.0),
            FloatingActionButton(
              onPressed: () {
                context.read<AudioRecorderController>().stop((recordingModel){
                  Navigator.pop(context,recordingModel);
                });;
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


class _TimerText extends StatelessWidget {
  //meka ithuruwai implement krn widy blnnko

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