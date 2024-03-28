import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:voicense_frontend/app/widgets/note_view_card.dart';
import 'package:voicense_frontend/app/widgets/search_bar.dart';

import '../controllers/lec_home_controller.dart';

class LecHomeView extends GetView<LecHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SearchBarTop(),
              topic(), 
              Expanded(
                
                child: ListView(
                  padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
                  children:  const [   
                RecentNoteViewCard(),
                RecentNoteViewCard(),
                RecentNoteViewCard(),
                RecentNoteViewCard(),
                RecentNoteViewCard(),
                RecentNoteViewCard(),
                RecentNoteViewCard(),
                RecentNoteViewCard(),
                RecentNoteViewCard(),
       
                 ],
                
                ),
              )
              ],
            
            ),
          ),);

  }

       Widget topic(){
    return Container(
                        margin: const EdgeInsets.only(bottom: 5,top:20,left: 15),
                        child: const Text("Recent Notes",
                        style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w400),
                        ),
                      );
  }

}
