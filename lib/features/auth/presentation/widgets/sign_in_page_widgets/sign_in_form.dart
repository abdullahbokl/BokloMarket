import 'package:boklo_mart/features/auth/presentation/widgets/sign_in_page_widgets/sign_in_password.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/data_validation.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:boklo_mart/config/routes/routes.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInBloc signInBloc = SignInBloc.get(context);

    return Form(
      key: signInBloc.signInFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: AppDimensions.height30),

            /// email
            CustomTextFormField(
              prefixIcon: Icons.mail_outline_outlined,
              controller: signInBloc.signInEmailController,
              hint: 'Email',
              validator: (value) {
                return DataValidation.validateEmail(value ?? '');
              },
            ),
            SizedBox(height: AppDimensions.height30),

            /// password
            const SignInPassword(),
            SizedBox(height: AppDimensions.height5),

            /// forget password button
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.kForgetPasswordRoute);
              },
              child: SizedBox(
                width: AppDimensions.width100,
                child: CustomText(
                  text: 'Forget Password!',
                  color: AppColors.secondaryColor,
                  fontSize: AppDimensions.font14,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(height: AppDimensions.height30),
            CustomButton(
              text: 'SIGN IN',
              onTap: () {
                if (signInBloc.signInFormKey.currentState!.validate()) {
                  signInBloc.add(SignInUsingEmailAndPassword());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
