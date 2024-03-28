import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectModuleItem extends GetView {
  const SelectModuleItem( {super.key, required this.text});

  final String text;// istead text should pass module class object

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      child: ElevatedButton(onPressed: (){}, child: Text(text,style:TextStyle(fontWeight:  FontWeight.w500,color:Colors.grey,fontSize: 18),),
      style: ElevatedButton.styleFrom(
        backgroundColor:const Color.fromARGB(169, 251, 194, 251),
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      )),
    );
  }
}
