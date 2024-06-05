import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/common_he/widgets/null_widget.dart';
import 'package:voicense_frontend/app/modules/explore/widget/module_add_null.dart';

class ExploreController extends GetxController {
  String userType;
  RxInt index = 0.obs;
  List<Widget> add_or_null = [const AddModule(), const NullWidget()]; 
  ExploreController(this.userType);

  @override
  void onInit() {
    super.onInit();
     if (userType == 'lec') {
     index.value = 0.obs as int;
    } else if (userType == 'stu') {
     index.value = 1.obs as int;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
