import 'package:clothus/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorDot extends StatefulWidget {
  final Color color;
  final bool isActive;
  final Function() press;
  const ColorDot({
    Key? key,
    required this.color,
    this.isActive = false,
    required this.press,
  }) : super(key: key);

  @override
  State<ColorDot> createState() => _ColorDotState();
}

class _ColorDotState extends State<ColorDot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.isActive ? primaryColor : Colors.transparent,
        ),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: widget.press,
        child: CircleAvatar(
          backgroundColor: widget.color,
          radius: 7,
        ),
      ),
    );
  }
}
