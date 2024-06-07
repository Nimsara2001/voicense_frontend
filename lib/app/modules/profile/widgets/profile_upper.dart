
import 'package:flutter/widgets.dart';

class ProfileUpper extends StatelessWidget {
  final String name;
  final String email;
  final String imageText;

  const ProfileUpper({super.key, required this.name, required this.email, required this.imageText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45.0),
            child: SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(image: AssetImage('assets/profile-pic.jpg')),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(name.toString()), // Access data from controller
          const SizedBox(height: 5.0),
          Text(email.toString()),
        ],
      ),
    );
  }
}