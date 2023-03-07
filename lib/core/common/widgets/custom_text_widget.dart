import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final Alignment? alignment;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final BoxDecoration? boxDecoration;
  final int? maxLines;
  final double? height;

  const CustomText({
    super.key,
    this.text = '',
    this.fontSize,
    this.color,
    this.alignment,
    this.fontWeight,
    this.textDecoration,
    this.boxDecoration,
    this.maxLines,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      height: height,
      alignment: alignment ?? Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? AppDimensions.font16,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.w600,
          decoration: textDecoration,
        ),
        textAlign: TextAlign.center,
        maxLines: maxLines,
      ),
    );
  }
}
