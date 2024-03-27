import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stu_note_controller.dart';

class StuNoteView extends GetView<StuNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StuNoteView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StuNoteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
