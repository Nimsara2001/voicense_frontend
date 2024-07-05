
import 'package:flutter/material.dart';
import 'package:voicense_frontend/app/util/theme.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:voicense_frontend/app/modules/trashed_items/views/trashed_items_view.dart';


// class ListTileItem extends StatelessWidget {
//   final String? text;
//   final IconData? icon;
  
//   const ListTileItem({Key? key, this.text, this.icon}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       widthFactor: 0.9,
//       child: ListTile(
//         tileColor: const Color.fromARGB(169, 251, 194, 251),
//         title: Text("$text"),
//         leading: Icon(icon),
//         shape: const StadiumBorder(),
//         contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
//         onTap: (){
//           if(text == "Sign Out"){
//             // Get.offAllNamed(Routes.LOGIN);
//           }
//           else if(text == "Change password"){
//             // Get.toNamed(Routes.CHANGE_PASSWORD);
//           }
//           else if(text == "Trashed Bin"){
//             Get.to(TrashedItemsView());
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/modules/trashed_items/views/trashed_items_view.dart';

class ListTileItemController extends GetxController{
  @override
  void onInit() {
    super.onInit();
  }
}

class ListTileItemView extends GetView{
  final String? text;
  final IconData? icon;
  
  const ListTileItemView({Key? key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: ListTile(
        tileColor: mySecondaryColor,
        title: Text("$text"),
        leading: Icon(icon),
        shape: const StadiumBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        onTap: (){
          if(text == "Sign Out"){
            // Get.offAllNamed(Routes.LOGIN);
          }
          else if(text == "Change password"){
            // Get.toNamed(Routes.CHANGE_PASSWORD);
          }
          else if(text == "Trashed Bin"){
            Get.to(TrashedItemsView());
          }
        },
      ),
    );
  }
}