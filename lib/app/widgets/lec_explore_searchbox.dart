import 'package:flutter/material.dart';
import 'package:voicense_frontend/app/util/theme.dart';


class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color:mySearchBoxColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        // onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: mySearchBoxTextColor),
        ),
      ),
    );
  }
}