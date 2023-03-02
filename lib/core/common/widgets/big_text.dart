import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';


class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;
  TextDecoration? decoration;
  int? maxLines;

  BigText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
    this.fontWeight = FontWeight.w400,
    this.decoration = TextDecoration.none,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? AppDimensions.font20 : size,
        fontWeight: fontWeight,
        decoration: decoration,
        // fontFamily: 'Roboto',
      ),
    );
  }
}
