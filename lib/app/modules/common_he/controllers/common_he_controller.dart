import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/common_he/widgets/plus_mark.dart';
import 'package:voicense_frontend/app/modules/common_he/widgets/null_widget.dart';
import 'package:voicense_frontend/app/modules/lec_explore/views/lec_explore_view.dart';
import 'package:voicense_frontend/app/modules/stu_explore/views/stu_explore_view.dart';
import 'package:voicense_frontend/app/modules/stu_home/views/stu_home_view.dart';

import '../../lec_home/views/lec_home_view.dart';

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
        LecHomeView(),
        LecExploreView(),
      ];
    } else if (userType == 'stu') {
      bodyViewList = [
        StuHomeView(),
        StuExploreView(),
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
