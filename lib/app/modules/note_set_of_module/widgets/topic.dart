import 'package:flutter/widgets.dart';

class Topic extends StatelessWidget {
  final String title;
  const Topic({required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 20, left: 15),
      child:  Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }
}