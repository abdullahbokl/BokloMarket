import 'package:boklo_mart/features/auth/presentation/cubits/show_hide_password_cubit/show_hide_password_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/password_text_field.dart';
import 'package:boklo_mart/core/utils/data_validation.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPassword extends StatelessWidget {
  const SignInPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ShowHidePasswordCubit showHidePasswordCubit =
    ShowHidePasswordCubit.get(context);
    final SignInBloc signInBloc = SignInBloc.get(context);

    return BlocBuilder<ShowHidePasswordCubit, ShowHidePasswordState>(
      builder: (context, state) {
        return PasswordTextField(
          isPasswordHidden: showHidePasswordCubit.isSignInPasswordHidden,
          onSuffixIconTap: () =>
              showHidePasswordCubit.showHidePassword(
                  type: AppStrings.kSignInPasswordController),
          controller: signInBloc.signInPasswordController,
          validator: (value) {
            return DataValidation.validatePassword(value ?? '');
          },
        );
      },
    );
  }
}
