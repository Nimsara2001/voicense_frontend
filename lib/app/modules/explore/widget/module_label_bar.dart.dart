import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/explore/controllers/explore_controller.dart';

class ModuleLabelBarView extends GetView {
  @override
  Widget build(BuildContext context) {
  
   ExploreController _controller=Get.find<ExploreController>();

    return Container(
      margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Modules",
            style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold),
          ),
       _controller.userType=='Lecturer'?_AddModule(context):Container(),
        ],
      ),
    );
  }

Widget _AddModule(BuildContext context){
    return IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Handle the button press here
            },
          );
  }

}

