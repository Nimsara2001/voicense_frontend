import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/common_he/widgets/plus_mark.dart';
import 'package:voicense_frontend/app/modules/common_he/widgets/null_widget.dart';
import 'package:voicense_frontend/app/modules/explore/views/explore_view.dart';
import 'package:voicense_frontend/app/modules/home/views/home_view.dart';

class CommonHeController extends GetxController {
  String userType;
  String user_id;

  List<Widget> bodyViewList = [];
  List<Widget> Plus_Null = [];
  var focused_value = 0.obs;

  CommonHeController(this.userType, this.user_id);


  @override
  void onInit() {
    super.onInit();
    print(user_id);
    if (userType == 'Lecturer') {
      Plus_Null = [
        PlusIcon(user_id:user_id), const NullWidget()
      ];
    } else if (userType == 'Student') {
      Plus_Null = [
        const NullWidget(), const NullWidget()
      ];
    }

    bodyViewList = [
      HomeView(),
      ExploreView(userType: userType),
    ];
    print("userTpe" + userType);
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
