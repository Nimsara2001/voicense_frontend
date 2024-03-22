import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stu_note_controller.dart';

class StuNoteView extends GetView<StuNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StuNoteView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StuNoteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
