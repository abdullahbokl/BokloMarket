import 'package:boklo_mart/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/data_validation.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordCubit resetPasswordCubit = ResetPasswordCubit.get(context);
    return Form(
      key: resetPasswordCubit.resetPasswordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomText(
            text: 'Please enter your email address\nto reset your password',
            color: Colors.grey,
            alignment: Alignment.center,
          ),
          SizedBox(height: AppDimensions.height30),
          CustomTextFormField(
            controller: resetPasswordCubit.resetPasswordController,
            hint: 'Email',
            validator: (value) {
              return DataValidation.validateEmail(value ?? '');
            },
          ),
          SizedBox(height: AppDimensions.height30),
          CustomButton(
            text: 'Reset Password',
            onTap: () {
              if (resetPasswordCubit.resetPasswordFormKey.currentState!
                  .validate()) {
                resetPasswordCubit.resetPassword();
              }
            },
          ),
        ],
      ),
    );
  }
}
