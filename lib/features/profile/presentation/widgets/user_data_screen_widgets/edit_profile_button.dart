import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:boklo_mart/config/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: AppDimensions.width100,
      height: AppDimensions.height30,
      suffixIcon: FontAwesomeIcons.solidPenToSquare,
      suffixIconColor: AppColors.primaryColor2,
      gradient: AppColors.secondaryGradient(),
      text: 'Edit profile',
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.kEditProfileRoute);
      },
    );
  }
}
