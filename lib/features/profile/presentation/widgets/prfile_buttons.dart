import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Update',
          onTap: () {},
        ),
        SizedBox(height: AppDimensions.height20),
        CustomButton(
          text: 'Save',
          onTap: () {},
        ),
      ],
    );
  }
}
