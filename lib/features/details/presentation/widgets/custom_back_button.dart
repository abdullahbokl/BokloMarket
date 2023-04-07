import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_sharp,
          color: Colors.white,
          size: AppDimensions.font24,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
