import 'dart:async';

import 'package:boklo_mart/core/view_model/auth_view_model.dart';
import 'package:boklo_mart/view/auth/register_page.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // AuthViewModel controller = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(text: 'Welcome', fontSize: 30),
                            InkWell(
                              onTap: () {
                                Get.toNamed(kRegisterRoute);
                              },
                              child: const CustomText(
                                  text: 'Sign Up',
                                  color: kPrimaryColor,
                                  fontSize: 18),
                            ),
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
                          controller: _emailController,
                          text: 'Email',
                          hint: 'example@mail.com',
                          onSave: (value) {},
                          validator: (value) {},
                        ),
                        const SizedBox(height: 40),
                        CustomTextFormField(
                          controller: _passwordController,
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
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              controller.signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                            }
                          },
                          text: 'SIGN IN',
                        ),
                        const SizedBox(height: 40),
                        const CustomText(
                            text: '-OR-', alignment: Alignment.center),
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
              ),
            ),
            if (controller.isLoading.value)
              Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  )),
            if (controller.isLoading.value)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ));
  }
}
