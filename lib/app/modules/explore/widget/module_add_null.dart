import 'package:flutter/material.dart';

class AddModule extends StatelessWidget {
  const AddModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Modules",
          style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            // Handle the button press here
          },
        ),
      ],
    ),
  );
  }
}