import 'package:flutter/material.dart';
import 'package:voicense_frontend/app/util/theme.dart';

class ListTileItem extends StatelessWidget {
  final String? text;
  final IconData? icon;
  
  const ListTileItem({Key? key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: ListTile(
        tileColor: mySecondaryColor,
        title: Text("$text"),
        leading: Icon(icon),
        shape: const StadiumBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        onTap: (){},
      ),
    );
  }
}
