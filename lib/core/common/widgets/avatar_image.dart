import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    super.key,
    required this.imageUrl,
    this.onTap,
  });

  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          height: AppDimensions.height160,
          width: AppDimensions.height160,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient(),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
