import 'package:boklo_mart/features/auth/presentation/cubits/show_hide_password_cubit/show_hide_password_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/password_text_field.dart';
import 'package:boklo_mart/core/utils/data_validation.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class RegisterPasswords extends StatelessWidget {
  const RegisterPasswords({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ShowHidePasswordCubit showHidePasswordCubit =
        ShowHidePasswordCubit.get(context);
    final RegisterBloc registerBloc = RegisterBloc.get(context);

    return BlocBuilder<ShowHidePasswordCubit, ShowHidePasswordState>(
      builder: (context, state) {
        return Column(
          children: [
            /// password
            PasswordTextField(
              isPasswordHidden: showHidePasswordCubit.isRegisterPasswordHidden,
              onSuffixIconTap: () => showHidePasswordCubit.showHidePassword(
                  type: AppStrings.kRegisterPasswordController),
              controller: registerBloc.signUpPasswordController,
              validator: (value) {
                return DataValidation.validatePassword(value ?? '');
              },
            ),
            SizedBox(height: AppDimensions.height30),

            /// confirm password
            PasswordTextField(
              isPasswordHidden:
                  showHidePasswordCubit.isRegisterConfirmPasswordHidden,
              onSuffixIconTap: () => showHidePasswordCubit.showHidePassword(
                  type: AppStrings.kRegisterConfirmPasswordController),
              controller: registerBloc.signUpConfirmPasswordController,
              validator: (value) {
                return DataValidation.validateConfirmPassword(
                  confirmPassword: value ?? '',
                  password: registerBloc.signUpPasswordController.text,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
