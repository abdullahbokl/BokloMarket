import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Gradient? gradient;
  final double? size;
  final double? height;
  final double? width;
  final Color textColor;
  final double? radius;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.color,
      this.size,
      this.height,
      this.width,
      this.gradient,
      this.textColor = Colors.white,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// custom button widget
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? AppDimensions.height50,
        width: width ?? double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.radius10,
          vertical: AppDimensions.radius5,
        ),
        decoration: BoxDecoration(
          color: color ?? Colors.blue,
          borderRadius: BorderRadius.circular(radius ?? AppDimensions.radius5),
          gradient: gradient,
        ),
        child: CustomText(
          text: text,
          color: textColor,
          fontSize: size ?? AppDimensions.font16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
