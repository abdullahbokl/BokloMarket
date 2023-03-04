import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontWeight;
  final TextDecoration? decoration;
  final int? maxLines;

  const CustomText({
    super.key,
    this.text = '',
    this.fontSize = 16.0,
    this.color = Colors.black,
    this.alignment = Alignment.center,
    this.fontWeight = FontWeight.w600,
    this.decoration = TextDecoration.none,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          decoration: decoration,
        ),
        textAlign: TextAlign.center,
        maxLines: maxLines,
      ),
    );
  }
}
