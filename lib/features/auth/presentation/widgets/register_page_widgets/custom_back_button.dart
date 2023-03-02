import 'package:boklo_mart/core/common/widgets/custom_icon_button_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height50,
      width: AppDimensions.width50,
      decoration: BoxDecoration(
        gradient: AppColors.secondaryGradient(),
        shape: BoxShape.circle,
      ),
      child:
      CustomIconButtonWidget(
        icon: const Icon(Icons.keyboard_backspace_sharp, color: Colors.white),
        onTap: () => GoRouter.of(context).pop(),
        size: AppDimensions.iconSize50,
      ),
    );
  }
}
