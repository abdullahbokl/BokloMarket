import 'package:boklo_mart/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:boklo_mart/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:boklo_mart/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:boklo_mart/features/auth/presentation/views/reset_password_page.dart';
import 'package:boklo_mart/features/auth/presentation/views/register_page.dart';
import 'package:boklo_mart/features/auth/presentation/views/sign_in_page.dart';
import 'package:boklo_mart/features/home/presentation/views/home_page.dart';
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

      /// home page
      GoRoute(
        path: Paths.kHomeRoute,
        name: Routes.kHomeRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeBloc()
            ..loadUserToken()
            ..add(FetchProducts())
            ..add(SelectCategory(index: 0)),
          child: const HomePage(),
        ),
      ),
    ],
  );
}
