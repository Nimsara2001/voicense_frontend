import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stu_explore_controller.dart';

class StuExploreView extends GetView<StuExploreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StuExploreView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StuExploreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
