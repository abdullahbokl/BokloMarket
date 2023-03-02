import 'package:boklo_mart/core/utils/app_assets.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    this.assetImagePath,
    this.networkImageUrl,
    this.imgHeight,
    this.imgWidth,
    this.onTap,
    this.bgColor,
    this.surroundingBGColor,
    this.radius,
    this.surroundingRadius,
    this.surroundingHeight,
    this.surroundingWidth,
    this.margin,
    this.padding,
    this.gradient,
  }) : super(key: key);

  final String? assetImagePath;
  final String? networkImageUrl;
  final double? imgHeight;
  final double? imgWidth;
  final VoidCallback? onTap;
  final Color? bgColor;
  final double? radius;
  final Color? surroundingBGColor;
  final double? surroundingRadius;
  final double? surroundingHeight;
  final double? surroundingWidth;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      /// the surrounding container
      child: Container(
        padding: padding,
        alignment: Alignment.center,
        height: surroundingHeight,
        width: surroundingWidth,
        decoration: BoxDecoration(
          color: surroundingBGColor,
          borderRadius: BorderRadius.circular(surroundingRadius ?? 0),
        ),

        /// the image
        child: Container(
          height: imgHeight ?? AppDimensions.height120,
          width: imgWidth ?? AppDimensions.height120,
          margin: margin ??
              EdgeInsets.only(
                top: AppDimensions.radius10,
                bottom: AppDimensions.radius10,
                left: AppDimensions.radius5,
                right: AppDimensions.radius5,
              ),
          decoration: BoxDecoration(
            color: bgColor,
            image: DecorationImage(
              image: _setImage(),
              fit: BoxFit.fitHeight,
            ),
            borderRadius: BorderRadius.circular(radius ?? 0),
            gradient: gradient,
          ),
        ),
      ),
    );
  }

  ImageProvider _setImage() {
    if (assetImagePath != null && assetImagePath!.isNotEmpty) {
      return AssetImage(assetImagePath!);
    } else if (networkImageUrl != null && networkImageUrl!.isNotEmpty) {
      return NetworkImage(networkImageUrl!);
    } else {
      return const AssetImage(AppImages.emptyImage);
    }
  }
}
