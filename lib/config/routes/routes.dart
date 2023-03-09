import 'package:flutter/material.dart';

class Routes {
  static final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

  static const String kOnBoardingRoute = 'onBoardingRoute';
  static const String kSignInRoute = 'signInRoute';
  static const String kRegisterRoute = 'registerRoute';
  static const String kForgetPasswordRoute = 'forgetPasswordRoute';
  static const String kBottomNavBarRoute = 'bottomNavBarRoute';
  static const String kHomeRoute = 'homeRoute';
  static const String kControlRoute = 'controlRoute';
  static const String kCartRoute = 'cartRoute';
  static const String kProfileRoute = 'profileRoute';
  static const String kEditProfileRoute = 'editProfileRoute';
}


class Paths {
  static const String kOnBoardingRoute = '/onBoarding';
  static const String kSignInRoute = '/signIn';
  static const String kRegisterRoute = 'register';
  static const String kForgetPasswordRoute = 'forgetPassword';
  static const String kBottomNavBarRoute = '/bottomNavBar';
  static const String kHomeRoute = '/home';
  static const String kControlRoute = 'control';
  static const String kCartRoute = 'cart';
  static const String kProfileRoute = '/profile';
  static const String kEditProfileRoute = 'editProfile';
}