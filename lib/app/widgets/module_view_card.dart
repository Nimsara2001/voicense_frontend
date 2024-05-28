import 'package:flutter/material.dart';

class ModuleViewCard extends StatelessWidget {
  final double popup_offset;

  ModuleViewCard({required this.popup_offset});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: SizedBox(
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 15, left: 5, right: 5),
          width: 170,
          height: 109,
          // Adjusted height to accommodate the additional content
          decoration: BoxDecoration(
            color: const Color.fromARGB(255,76, 58, 134),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Data\nStructures",
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child:PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  offset: Offset(popup_offset,45),
                  shape: const TooltipShape(),
                  onSelected: (String choice) {
                    // Handle the selected choice
                    if (choice == 'Share') {
                      // Handle share functionality
                    } else if (choice == 'Edit') {
                      // Handle edit functionality
                    } else if (choice == 'Trash') {
                      // Handle trash functionality
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Share',
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0), // Minimize padding
                        leading: Icon(Icons.share, size: 20), // Adjust icon size
                        title: Text('Share', style: TextStyle(fontSize: 14)), // Adjust text size
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Edit',
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0), // Minimize padding
                        leading: Icon(Icons.edit, size: 20), // Adjust icon size
                        title: Text('Edit', style: TextStyle(fontSize: 14)), // Adjust text size
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Trash',
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0), // Minimize padding
                        leading: Icon(Icons.delete, size: 20), // Adjust icon size
                        title: Text('Trash', style: TextStyle(fontSize: 14)), // Adjust text size
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TooltipShape extends ShapeBorder {
  const TooltipShape();

  final BorderSide _side = BorderSide.none;
  final BorderRadiusGeometry _borderRadius = BorderRadius.zero;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(_side.width);

  @override
  Path getInnerPath(
      Rect rect, {
        TextDirection? textDirection,
      }) {
    final Path path = Path();

    path.addRRect(
      _borderRadius.resolve(textDirection).toRRect(rect).deflate(_side.width),
    );

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    final RRect rrect = _borderRadius.resolve(textDirection).toRRect(rect);

    path.moveTo(0, 10);
    path.quadraticBezierTo(0, 0, 10, 0);
    path.lineTo(rrect.width - 30, 0);
    path.lineTo(rrect.width - 20, -10);
    path.lineTo(rrect.width - 10, 0);
    path.quadraticBezierTo(rrect.width, 0, rrect.width, 10);
    path.lineTo(rrect.width, rrect.height - 10);
    path.quadraticBezierTo(
        rrect.width, rrect.height, rrect.width - 10, rrect.height);
    path.lineTo(10, rrect.height);
    path.quadraticBezierTo(0, rrect.height, 0, rrect.height - 10);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => RoundedRectangleBorder(
    side: _side.scale(t),
    borderRadius: _borderRadius * t,
  );
}


