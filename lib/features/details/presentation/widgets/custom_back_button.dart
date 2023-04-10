import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  /// todo : make the back button work
  // error


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: AppDimensions.height45,
        width: AppDimensions.width45,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(AppDimensions.width20),
          ),
        ),
        margin: EdgeInsets.only(
          top: AppDimensions.height40,
          left: AppDimensions.width20,
        ),
        child: Icon(
          Icons.arrow_back_sharp,
          color: Colors.white,
          size: AppDimensions.font24,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
