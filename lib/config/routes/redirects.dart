import 'package:boklo_mart/features/bottom_navigation_bar/presentation/views/bottom_nav_bar_screen.dart';
import 'package:boklo_mart/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:boklo_mart/features/auth/presentation/views/sign_in_screen.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class Redirects {
  /// redirect to Login page on boarding is already visited

  static Widget redirection() {
    if (Hive.box(AppStrings.kOnBoardingBox).get(AppStrings.kOnBoardingBox) !=
        true) {
      return const OnBoardingScreen();
    } else {
      if (FirebaseAuth.instance.currentUser == null) {
        return const SignInScreen();
      } else {
        return const BottomNavBarScreen();
      }
    }
  }
}
