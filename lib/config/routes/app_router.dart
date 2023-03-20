import 'package:boklo_mart/features/bottom_navigation_bar/presentation/views/bottom_nav_bar_screen.dart';
import 'package:boklo_mart/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:boklo_mart/features/auth/presentation/views/reset_password_screen.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/features/profile/presentation/views/profile_screen.dart';
import 'package:boklo_mart/features/auth/presentation/views/register_screen.dart';
import 'package:boklo_mart/features/auth/presentation/views/sign_in_screen.dart';
import 'package:boklo_mart/features/home/presentation/views/home_screen.dart';
import 'package:boklo_mart/config/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    // on boarding screen
      case Routes.kOnBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
    // return sign in screen
      case Routes.kSignInRoute:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );
    // return register screen
      case Routes.kRegisterRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
    // forget password screen
      case Routes.kForgetPasswordRoute: // return forget password screen
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );
    // bottom nav bar screen
      case Routes.kBottomNavBarRoute:
        return MaterialPageRoute(
          builder: (_) => const BottomNavBarScreen(),
        );
    // home screen
      case Routes.kHomeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    // profile screen
      case Routes.kProfileRoute:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case Routes.kEditProfileRoute:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              BlocProvider.value(
                value: AuthBloc.get(context),
                // child: const EditEmailScreen(),
              ),
        );
    // default route (error)
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(
                body: Center(
                  child: Text(
                    'No route defined for ${settings.name}',
                  ),
                ),
              ),
        );
    }
  }
}
