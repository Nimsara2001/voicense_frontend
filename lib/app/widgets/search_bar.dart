// import 'package:flutter/material.dart';

// class SearchBarExplore extends StatelessWidget{
//   const SearchBarExplore({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 234, 230, 239),
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: const TextField(
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.search),
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarController extends GetxController {

  final TextEditingController searchTextController = TextEditingController();
  // final searchText = ''.obs; 

  // void onSearchTextChanged(String text) {
  //   searchText.value = text;
  // }
}
class SearchBarExplore extends GetView<SearchBarController> {

  final SearchBarController _controllerX = Get.put(SearchBarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 230, 239),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _controllerX.searchTextController,
        decoration: const InputDecoration(
          prefixIcon:  Icon(Icons.search),
          border: InputBorder.none,
          hintText: 'Search here',
        ),
        onChanged: (text) {}
      ),
    );
  }
}
