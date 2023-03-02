import 'package:boklo_mart/features/auth/presentation/views/reset_password_page.dart';
import 'package:boklo_mart/features/auth/presentation/views/sign_in_page.dart';
import 'package:boklo_mart/features/home/views/pages/home_page.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimensions.height = MediaQuery.of(context).size.height;
    AppDimensions.width = MediaQuery.of(context).size.width;
    return
        // RegisterPage();
        // ResetPasswordPage();
        FirebaseAuth.instance.currentUser != null ? HomePage() : SignInPage();
  }
}
