import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key, required this.welcomeMessage}) : super(key: key);

  final String welcomeMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CustomText(text: 'Welcome', fontSize: AppDimensions.font30),
            SizedBox(height: AppDimensions.height5),
            CustomText(
              text: welcomeMessage,
              fontSize: AppDimensions.font14,
              color: AppColors.hintColor,
            ),
          ],
        ),
      ],
    );
  }
}
