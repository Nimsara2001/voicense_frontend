import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/common_he/widgets/plus_mark.dart';
import 'package:voicense_frontend/app/modules/common_he/widgets/null_widget.dart';
import 'package:voicense_frontend/app/modules/explore/views/explore_view.dart';
import 'package:voicense_frontend/app/modules/home/views/home_view.dart';

class CommonHeController extends GetxController {
  String userType;
  List<Widget> bodyViewList = [];
  final List<Widget> Plus_Null = [const PlusIcon(), const NullWidget()];
  final focused_value = 0.obs;

    CommonHeController(this.userType);


  @override
  void onInit() {
    super.onInit();
    if (userType == 'lec') {
      bodyViewList = [
        HomeView(),
        ExploreView(userType: userType),
      ];
    } else if (userType == 'stu') {
      bodyViewList = [
        HomeView(),
        ExploreView(userType: userType),
      ];
    }
    print("userTpe"+userType);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void move_page(int index) {
    focused_value.value = index;
  }
}
