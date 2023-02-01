import 'package:boklo_mart/core/view_model/auth_view_model.dart';
import 'package:boklo_mart/view/widgets/custom_button_social_widget.dart';
import 'package:boklo_mart/view/widgets/custom_button_widget.dart';
import 'package:boklo_mart/view/widgets/custom_text_widget.dart';
import 'package:boklo_mart/view/widgets/cutom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:boklo_mart/constants.dart';

class RegisterPage extends GetWidget<AuthViewModel> {
  RegisterPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameCintroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomText(text: 'Welcome', fontSize: 30),
                      const SizedBox(height: 10),
                      const CustomText(
                        text: 'Sign up to Continue',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        controller: _nameCintroller,
                        text: 'Name',
                        hint: 'John Doe',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                        },
                      ),
                      const SizedBox(height: 40),
                      CustomTextFormField(
                        controller: _emailController,
                        text: 'Email',
                        hint: 'example@mail.com',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                        },
                      ),
                      const SizedBox(height: 40),
                      CustomTextFormField(
                        controller: _passwordController,
                        text: 'Password',
                        hint: '************',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            controller.createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                                name: _nameCintroller.text);
                          }
                        },
                        text: 'SIGN UP',
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
      ),
    );
  }
}
