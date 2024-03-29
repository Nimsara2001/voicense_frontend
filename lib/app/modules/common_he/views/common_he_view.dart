import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/common_he_controller.dart';

class CommonHeView extends GetView<CommonHeController> {
  @override
  Widget build(BuildContext context) {
    final CommonHeController _controller = Get.put(CommonHeController());

    return Scaffold(
      //       appBar: AppBar(
      //   title: const Text('CommonHomeExploreView'),
      //   centerTitle: true,
      // ),
      body:
          Obx(() => _controller.Home_Explore[_controller.focused_value.value]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _controller.focused_value.value,
        onDestinationSelected: (int index) {
          _controller.move_page(index);
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          Obx(() => _controller.Plus_Null[_controller.focused_value.value]),
    );
  }
}
