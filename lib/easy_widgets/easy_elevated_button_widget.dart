
import 'package:flutter/material.dart';

import 'easy_text_widget.dart';

class EasyElevatedButtonWidget extends StatelessWidget {
  const EasyElevatedButtonWidget({
    Key? key,
    required this.buttonIcon,
    required this.func,
    this.width=90,
    this.height=91,
    this.buttonColor=const Color.fromRGBO(22, 31, 24, 1),
    this.textColor=Colors.white,
  }) : super(key: key);

  final double width;
  final double height;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback? func;
  final String buttonIcon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        fixedSize:Size(width, height),
      ),
      child:EasyTextWidget(text: buttonIcon,color: textColor)
    );
  }
}