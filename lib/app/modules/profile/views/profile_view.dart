import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/explore/controllers/explore_controller.dart';
import 'package:voicense_frontend/app/modules/profile/widgets/profile_listTile.dart';
import 'package:voicense_frontend/app/modules/profile/widgets/profile_upper.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final ExploreController _controllerfromLogin  = Get.find<ExploreController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: const Icon(Icons.arrow_back)),
        ),
        // backgroundColor: Colors.amberAccent,
        body: SingleChildScrollView(
          child:  Column(
            children: [
            ProfileUpper(name:"Mihin Premarathna",email:"mihin.nimsara.2001@gmail.com",imageText:"gggh"),
            // SizedBox(height: 35,),
            // DarkMode(),// should make
            const SizedBox(height:30,),
            const ListTileItemView(text:"Change password",icon:Icons.build),
            const SizedBox(height:30,),
             _controllerfromLogin.userType == "Lecturer" ? ListTileItemView(text:"Trashed Bin",icon:Icons.delete) : Container(),
             const SizedBox(height:30,),
            const ListTileItemView(text:"Sign Out",icon:Icons.logout),
            
            ],
          ),
        ),
      );
  }
}
