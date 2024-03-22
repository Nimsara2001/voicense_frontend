import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lec_home_controller.dart';

class LecHomeView extends GetView<LecHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LecHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LecHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
