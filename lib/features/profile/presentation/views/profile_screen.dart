import 'package:boklo_mart/features/profile/presentation/widgets/edit_avatar_image.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/sign_out_button.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/user_data_texts.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppDimensions.height30),
            // user image
            const EditAvatarImage(),
            SizedBox(height: AppDimensions.height50),
            // user data texts
            const UserDataTexts(),
            SizedBox(height: AppDimensions.height50),
            // sign out button
            const SignOutButton(),
          ],
        ),
      ),
    );
  }

  EdgeInsets _padding() {
    return EdgeInsets.only(
      top: AppDimensions.height15,
      left: AppDimensions.width30,
      right: AppDimensions.width30,
      bottom: AppDimensions.height5,
    );
  }
}
