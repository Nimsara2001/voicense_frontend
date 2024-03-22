import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lec_explore_controller.dart';

class LecExploreView extends GetView<LecExploreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LecExploreView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LecExploreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
