import 'package:boklo_mart/features/auth/presentation/widgets/register_page_widgets/register_passwords.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/core/utils/data_validation.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = RegisterBloc.get(context);
    return Form(
      key: registerBloc.signUpFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// name
            CustomTextFormField(
              prefixIcon: Icons.person_outline_outlined,
              controller: registerBloc.signUpNameController,
              hint: 'Name',
              validator: (value) {
                return DataValidation.validateName(value ?? '');
              },
            ),
            SizedBox(height: AppDimensions.height30),

            /// email
            CustomTextFormField(
              prefixIcon: Icons.mail_outline_outlined,
              controller: registerBloc.signUpEmailController,
              hint: 'Email',
              validator: (value) {
                return DataValidation.validateEmail(value ?? '');
              },
            ),
            SizedBox(height: AppDimensions.height30),

            /// password and confirm password
            const RegisterPasswords(),
            SizedBox(height: AppDimensions.height30),

            /// Submit button
            CustomButton(
              text: 'SIGN UP',
              onTap: () {
                if (registerBloc.signUpFormKey.currentState!.validate()) {
                  registerBloc.add(
                    RegisterNewUser(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
