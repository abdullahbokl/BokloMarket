import 'package:boklo_mart/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class EditUserDataTextFormFields extends StatelessWidget {
  const EditUserDataTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = ProfileCubit.get(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            /// todo : add user name
            CustomTextFormField(
              isEnabled: profileCubit.isNameEnabled,
              prefixIcon: Icons.person,
              controller: profileCubit.nameController,
              suffixIcon: FontAwesomeIcons.solidPenToSquare,
            ),
            SizedBox(height: AppDimensions.height20),

            /// todo : add user email
            CustomTextFormField(
              isEnabled: profileCubit.isEmailEnabled,
              prefixIcon: Icons.email,
              controller: profileCubit.emailController,
              suffixIcon: FontAwesomeIcons.solidPenToSquare,
            ),
            SizedBox(height: AppDimensions.height20),

            /// todo : password
            CustomTextFormField(
              isEnabled: profileCubit.isPasswordEnabled,
              prefixIcon: Icons.password,
              controller: profileCubit.passwordController,
              suffixIcon: FontAwesomeIcons.solidPenToSquare,
            ),
          ],
        );
      },
    );
  }
}
