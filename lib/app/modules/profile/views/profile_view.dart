import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/profile/widgets/profile_listTile.dart';
import 'package:voicense_frontend/app/modules/profile/widgets/profile_upper.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: const Icon(Icons.arrow_back)),
        ),
        // backgroundColor: Colors.amberAccent,
        body: const SingleChildScrollView(
          child:  Column(
            children: [
            ProfileUpper(name:"hansaka",email:"new1818155@gmail.com",imageText:"gggh"),
            // SizedBox(height: 35,),
            // DarkMode(),// should make
            SizedBox(height:30,),
            ListTileItem(text:"Change password",icon:Icons.build),
            SizedBox(height:30,),
            ListTileItem(text:"Sign Out",icon:Icons.logout),
            SizedBox(height:30,),
            ],
          ),
        ),
      );
  }
}
