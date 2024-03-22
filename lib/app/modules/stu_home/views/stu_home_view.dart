import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stu_home_controller.dart';

class StuHomeView extends GetView<StuHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StuHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StuHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
