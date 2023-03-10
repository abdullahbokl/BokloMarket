import 'package:boklo_mart/features/auth/presentation/cubits/show_hide_password_cubit/show_hide_password_cubit.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/config/routes/app_router.dart';
import 'package:boklo_mart/config/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class BokloMarket extends StatelessWidget {
  const BokloMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// set the height and width of the screen
    AppDimensions.height = MediaQuery.of(context).size.height;
    AppDimensions.width = MediaQuery.of(context).size.width;

    return MultiBlocProvider(
      providers: [
        /// add auth bloc
        // BlocProvider<AuthBloc>(create: (context) => AuthBloc()),

        /// show hide password cubit
        BlocProvider<ShowHidePasswordCubit>(
            create: (context) => ShowHidePasswordCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme(),
        title: 'Boklo Market',

        routerConfig: AppRouter.goRouter,
      ),
    );
  }
}
