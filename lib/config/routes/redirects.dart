import 'package:boklo_mart/config/routes/routes.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Redirects {
  /// redirect to Login page on boarding is already visited
  static FutureOr<String?> redirectIfOnBoardingVisited(
      BuildContext context, GoRouterState state) {
    return Hive.box(AppStrings.kOnBoardingBox).get(AppStrings.kOnBoardingBox) != true
        ? null
        : Paths.kSignInRoute;
  }

  /// redirect to home page if user is logged in
  static FutureOr<String?> redirectIfLoggedIn(
      BuildContext context, GoRouterState state) {
    return FirebaseAuth.instance.currentUser != null ? Paths.kBottomNavBarRoute : null;
  }
}
