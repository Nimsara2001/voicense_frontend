import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:voicense_frontend/app/models/module_model.dart';
import 'package:voicense_frontend/app/modules/note_set_of_module/views/note_set_of_module_view.dart';

class OtherNoteController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }
}

class OtherNoteView extends GetView<OtherNoteController>{
  Module other_module;
  OtherNoteView(this.other_module);

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(top: 30, right: 10, left: 10),
      child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
                  Get.to(NoteSetOfModuleView(module: other_module,));
            },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(370, 60),
            backgroundColor: const Color.fromARGB(255,100, 82, 159),
            foregroundColor: Colors.white,
          ),
          child: const Text(
            "Other Notes",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    ),
  );
  }
}