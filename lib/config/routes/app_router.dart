import 'dart:async';
import 'package:boklo_mart/features/auth/presentation/views/reset_password_page.dart';
import 'package:boklo_mart/features/auth/presentation/views/register_page.dart';
import 'package:boklo_mart/features/auth/presentation/views/sign_in_page.dart';
import 'package:boklo_mart/features/home/views/pages/home_page.dart';
import 'package:boklo_mart/features/splash/views/splash_screen.dart';
import 'package:boklo_mart/config/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

/// GoRouter configuration
class AppRouter {
  const AppRouter();
  /// navigator key
  static final GoRouter goRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.kSplashRoute,
        builder: (context, state) => const SplashScreen(),
      ),

      /// login page
      GoRoute(
        path: Routes.kSignInRoute,
        name: Routes.kSignInRoute,
        redirect: _redirectIfLoggedIn,
        builder: (context, state) => const SignInPage(),
        routes: [
          /// register page
          GoRoute(
            path: Routes.kRegisterRoute,
            name: Routes.kRegisterRoute,
            builder: (context, state) => const RegisterPage(),
          ),

          /// forget password page
          GoRoute(
            path: Routes.kForgetPasswordRoute,
            name: Routes.kForgetPasswordRoute,
            builder: (context, state) => const ResetPasswordPage(),
          ),
        ],
      ),

      /// home page
      GoRoute(
        path: Routes.kHomeRoute,
        name: Routes.kHomeRoute,
        builder: (context, state) => HomePage(),
      ),
    ],
    initialLocation: Routes.kSplashRoute,
  );

  static FutureOr<String?> _redirectIfLoggedIn(BuildContext context, GoRouterState state) {
    print(state.location);
    if (state.location == Routes.kSignInRoute) {
      return FirebaseAuth.instance.currentUser != null ? Routes.kHomeRoute : null;
    }
    return null;
  }
}
