import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/models/module_model.dart';
import 'package:voicense_frontend/app/modules/explore/widget/module_label_bar.dart.dart';
import 'package:voicense_frontend/app/modules/explore/widget/other_note.dart';
import 'package:voicense_frontend/app/modules/login/controllers/login_controller.dart';
import 'package:voicense_frontend/app/modules/note_set_of_module/views/note_set_of_module_view.dart';
import 'package:voicense_frontend/app/widgets/module_view_card.dart';
import 'package:voicense_frontend/app/widgets/search_bar.dart';
import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  String? userType;
  ExploreView({this.userType});

  @override
  Widget build(BuildContext context) {
    final LoginController _controllerfromLogin  = Get.find<LoginController>();
    final ExploreController controller = Get.put(ExploreController(userType!));
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarExplore(),
            OtherNoteView(_controllerfromLogin.other_module_list[0]),
            ModuleLabelBarView(),
            Expanded(
              child: Obx(() =>GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 4.0, //_controllerfromLogin.module_list[index].module_name
                crossAxisSpacing: 4.0,
                children: List.generate(_controllerfromLogin.module_list.length, (index) {
                         return ModuleViewCard(_controllerfromLogin.module_list[index],popup_offset: index % 2 == 0 ? -70 : -5);
                  }
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

// // ignore: non_constant_identifier_names
// Widget OtherNotes(BuildContext context) {
//   Module other_module; // Define the variable 'other_module' here
//   return Container(
//     margin: const EdgeInsets.only(top: 30, right: 10, left: 10),
//       child:Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ElevatedButton(
//             onPressed: () {
//                   Get.to(NoteSetOfModuleView(module: other_module));
//             },
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             elevation: 0,
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             minimumSize: const Size(370, 60),
//             backgroundColor: const Color.fromARGB(255,100, 82, 159),
//             foregroundColor: Colors.white,
//           ),
//           child: const Text(
//             "Other Notes",
//             style: TextStyle(fontSize: 20),
//           ),
//         )
//       ],
//     ),
//   );
// }



