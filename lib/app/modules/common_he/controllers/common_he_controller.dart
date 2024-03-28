import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/common_he/widgets/Plus_mark.dart';
import 'package:voicense_frontend/app/modules/common_he/widgets/null_widget.dart';
import 'package:voicense_frontend/app/modules/lec_explore/views/lec_explore_view.dart';
import 'package:voicense_frontend/app/modules/lec_home/views/lec_home_view.dart';

class CommonHeController extends GetxController {
  //TODO: Implement CommonHeController

  final List<Widget> Home_Explore=[LecHomeView(), LecExploreView()];
  final List<Widget> Plus_Null =[const PlusIcon(),const NullWidget()];

  final focused_value = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void move_page(int index){
    focused_value.value=index;
  }
}
