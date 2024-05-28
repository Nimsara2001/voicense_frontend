import 'package:flutter/material.dart';

class SearchBarExplore extends StatelessWidget{
  const SearchBarExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 230, 239),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}