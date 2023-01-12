import 'package:flutter/material.dart';

class EasyTextWidget extends StatelessWidget {
  const EasyTextWidget({
    Key? key,
    required this.text,
    this.fontSize=35,
    this.color=Colors.white

  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      fontSize: fontSize,
      color: color,
    ),);
  }
}