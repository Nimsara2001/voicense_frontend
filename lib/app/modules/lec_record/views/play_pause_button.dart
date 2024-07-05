import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'package:voicense_frontend/app/util/theme.dart';


class PlayPauseButton extends StatelessWidget {
  final bool isPlaying;
  final Function()? onTap;
  const PlayPauseButton({super.key, required this.isPlaying, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: myPrimaryColor,
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