import 'package:boklo_mart/core/view_model/auth_view_model.dart';
import 'package:boklo_mart/view/widgets/custom_button_social_widget.dart';
import 'package:boklo_mart/view/widgets/custom_button_widget.dart';
import 'package:boklo_mart/view/widgets/custom_text_widget.dart';
import 'package:boklo_mart/view/widgets/cutom_text_form_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:boklo_mart/constants.dart';

class LoginPage extends GetWidget<AuthViewModel> {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText(text: 'Welcome', fontSize: 30),
                  CustomText(
                      text: 'Sign Up', color: kPrimaryColor, fontSize: 18),
                ],
              ),
              const SizedBox(height: 10),
              const CustomText(
                text: 'Sign in to Continue',
                fontSize: 14,
                color: Colors.grey,
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                text: 'Email',
                hint: 'example@mail.com',
                onSave: (value) {},
                validator: (value) {},
              ),
              const SizedBox(height: 40),
              CustomTextFormField(
                text: 'Password',
                hint: '************',
                onSave: (value) {},
                validator: (value) {},
              ),
              const SizedBox(height: 20),
              const CustomText(
                text: 'Forget Password',
                fontSize: 14,
                alignment: Alignment.topRight,
              ),
              const SizedBox(height: 15),
              CustomButton(
                onPress: () {},
                text: 'SIGN IN',
              ),
              const SizedBox(height: 40),
              const CustomText(text: '-OR-', alignment: Alignment.center),
              const SizedBox(height: 40),
              CustomButtonSocial(
                text: 'Sign In with Facebook',
                onPress: () {
                  controller.signInWithFacebook();
                },
                imageName: 'assets/images/facebook.png',
              ),
              const SizedBox(height: 40),
              CustomButtonSocial(
                text: 'Sign In with Google',
                onPress: () {
                  controller.googleSignInMethod();
                },
                imageName: 'assets/images/google.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
