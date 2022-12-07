// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/config/app_theme.dart';

class Avatar extends StatefulWidget {
  final icon, height, width, size, color, image;
  const Avatar({
    Key? key,
    this.icon,
    this.height,
    this.width,
    this.size,
    this.color,
    this.image,
  }) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return widget.icon != null
        ? SizedBox(
            child: Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: widget.color ?? colorWhite),
                child: widget.icon))
        : SizedBox(
            child: Container(
                height: widget.height,
                width: widget.width,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/shamim.jpg"),
                  radius: widget.size,
                  backgroundColor: Colors.transparent,
                )));
  }
}
