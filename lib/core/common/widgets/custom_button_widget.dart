import 'package:boklo_mart/core/common/widgets/big_text.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final double? size;
  final double? height;
  final double? width;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    this.size,
    this.height,
    this.width,
  }) : super(key: key);

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
          borderRadius: BorderRadius.circular(AppDimensions.radius5),
          gradient: AppColors.secondaryGradient(),
        ),
        child: BigText(
          text: text,
          color: Colors.white,
          size: size ?? AppDimensions.font16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
