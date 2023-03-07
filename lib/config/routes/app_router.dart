import 'package:boklo_mart/features/bottom_navigation_bar/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:boklo_mart/features/bottom_navigation_bar/presentation/views/bottom_nav_bar_screen.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:boklo_mart/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:boklo_mart/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:boklo_mart/features/auth/presentation/views/reset_password_page.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:boklo_mart/features/profile/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/features/profile/presentation/views/profile_screen.dart';
import 'package:boklo_mart/features/auth/presentation/views/register_page.dart';
import 'package:boklo_mart/features/auth/presentation/views/sign_in_page.dart';
import 'package:boklo_mart/features/home/presentation/views/home_screen.dart';
import 'package:boklo_mart/config/routes/redirects.dart';
import 'package:boklo_mart/config/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// GoRouter configuration
class AppRouter {
  const AppRouter();

  static final GoRouter goRouter = GoRouter(
    initialLocation: Paths.kOnBoardingRoute,
    routes: <RouteBase>[
      /// on boarding page
      GoRoute(
        path: Paths.kOnBoardingRoute,
        name: Routes.kOnBoardingRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => OnBoardingBloc(),
          child: const OnBoardingScreen(),
        ),
        redirect: Redirects.redirectIfOnBoardingVisited,
      ),

      /// login page
      GoRoute(
        path: Paths.kSignInRoute,
        name: Routes.kSignInRoute,
        redirect: Redirects.redirectIfLoggedIn,
        builder: (context, state) => BlocProvider(
          create: (context) => SignInBloc(),
          child: const SignInPage(),
        ),
        routes: [
          /// register page
          GoRoute(
            path: Paths.kRegisterRoute,
            name: Routes.kRegisterRoute,
            builder: (context, state) => BlocProvider(
              create: (context) => RegisterBloc(),
              child: const RegisterPage(),
            ),
          ),

          /// forget password page
          GoRoute(
            path: Paths.kForgetPasswordRoute,
            name: Routes.kForgetPasswordRoute,
            builder: (context, state) => BlocProvider(
              create: (context) => ResetPasswordCubit(),
              child: const ResetPasswordPage(),
            ),
          ),
        ],
      ),

      /// bottom navigation bar
      GoRoute(
        path: Paths.kBottomNavBarRoute,
        name: Routes.kBottomNavBarRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            /// bottom navigation bar cubit
            BlocProvider(create: (context) => BottomNavBarCubit()),
            /// Home blocs
            BlocProvider(create: (context) => AuthBloc()),
            BlocProvider(
              create: (context) => HomeBloc()
                ..loadUserToken()
                ..add(FetchProducts())
                ..add(SelectCategory(index: 0)),
            ),
            /// Profile bloc
            BlocProvider(create: (context) => ProfileCubit()..fetchUser()),
          ],
          child: const BottomNavBarScreen(),
        ),
      ),

      /// bottom navigation screen
      ShellRoute(
        builder: (context, state, child) => const BottomNavBarScreen(),
        routes: [
          /// home screen
          GoRoute(
            path: Paths.kHomeRoute,
            name: Routes.kHomeRoute,
            builder: (context, state) => const HomeScreen(),
          ),

          /// profile screen
          GoRoute(
            path: Paths.kProfileRoute,
            name: Routes.kProfileRoute,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),

      /// home page
      // GoRoute(
      //   path: Paths.kHomeRoute,
      //   name: Routes.kHomeRoute,
      //   builder: (context, state) => MultiBlocProvider(
      //     providers: [
      //       BlocProvider(create: (context) => AuthBloc()),
      //       BlocProvider(
      //         create: (context) => HomeBloc()
      //           ..loadUserToken()
      //           ..add(FetchProducts())
      //           ..add(SelectCategory(index: 0)),
      //       ),
      //     ],
      //     child: const HomePage(),
      //   ),
      // ),
    ],
  );
}
