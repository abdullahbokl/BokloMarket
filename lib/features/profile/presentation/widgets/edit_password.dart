import 'package:boklo_mart/features/auth/presentation/cubits/show_hide_password_cubit/show_hide_password_cubit.dart';
import 'package:boklo_mart/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/edit_password_listener.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/password_text_field.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/save_button.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/data_validation.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class EditPassword extends StatelessWidget {
  const EditPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileCubit profileCubit = ProfileCubit.get(context);
    final ShowHidePasswordCubit showHidePasswordCubit =
        ShowHidePasswordCubit.get(context);
    return EditPasswordListener(
      child: BlocBuilder<ShowHidePasswordCubit, ShowHidePasswordState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppDimensions.width20,
              vertical: AppDimensions.height20,
            ),
            child: Form(
              key: profileCubit.passwordFormKey,
              child: Column(
                children: [
                  CustomText(
                    text: 'Edit your password',
                    fontSize: AppDimensions.font20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: AppDimensions.height20),

                  /// password
                  PasswordTextField(
                    isPasswordHidden:
                        showHidePasswordCubit.isRegisterPasswordHidden,
                    onSuffixIconTap: () =>
                        showHidePasswordCubit.showHidePassword(
                            type: AppStrings.kRegisterPasswordController),
                    controller: profileCubit.passwordController,
                    validator: (value) {
                      return DataValidation.validatePassword(value ?? '');
                    },
                  ),
                  SizedBox(height: AppDimensions.height30),

                  /// confirm password
                  PasswordTextField(
                    isPasswordHidden:
                        showHidePasswordCubit.isRegisterConfirmPasswordHidden,
                    onSuffixIconTap: () =>
                        showHidePasswordCubit.showHidePassword(
                            type:
                                AppStrings.kRegisterConfirmPasswordController),
                    controller: profileCubit.confirmPasswordController,
                    validator: (value) {
                      return DataValidation.validateConfirmPassword(
                        confirmPassword: value ?? '',
                        password: profileCubit.passwordController.text,
                      );
                    },
                  ),
                  SizedBox(height: AppDimensions.height20),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return SaveButton(
                        onTap: () {
                          if (profileCubit.passwordFormKey.currentState!
                              .validate()) {
                            profileCubit.updatePassword();
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
