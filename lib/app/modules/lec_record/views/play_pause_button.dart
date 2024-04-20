import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';


class PlayPauseButton extends StatelessWidget {
  final bool isPlaying;
  final Function()? onTap;
  const PlayPauseButton({super.key, required this.isPlaying, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: Color(0xff21005D),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 100,
          height: 100,
          padding: EdgeInsets.only(
            left: isPlaying ? 0 : 4,
          ),
          child: Icon(
            isPlaying ? Icons.pause : Icons.mic,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}