import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lec_record_controller.dart';

class LecRecordView extends GetView<LecRecordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LecRecordView By Pabasara'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LecRecordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
