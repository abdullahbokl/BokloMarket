import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomIconButtonWidget extends StatelessWidget {
  const CustomIconButtonWidget({
    Key? key,
    required this.onTap,
    this.icon,
    this.size,
    this.color,
    this.bgColor,
    this.height,
    this.width,
    this.borderColor,
    this.image,
  }) : super(key: key);

  final Image? image;
  final Icon? icon;
  final VoidCallback onTap;
  final double? size;
  final Color? color;
  final Color? bgColor;
  final double? height;
  final double? width;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? AppDimensions.height35,
        width: width ?? AppDimensions.width35,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                  width: AppDimensions.width3,
                )
              : null,
        ),
        child: icon ?? image,
      ),
    );
  }
}
