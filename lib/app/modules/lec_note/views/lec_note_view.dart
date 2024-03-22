import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lec_note_controller.dart';

class LecNoteView extends GetView<LecNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LecNoteView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LecNoteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
