import 'package:boklo_mart/features/bottom_navigation_bar/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:boklo_mart/features/bottom_navigation_bar/presentation/views/bottom_nav_bar_body.dart';
import 'package:boklo_mart/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// bottom navigation bar cubit
        BlocProvider(create: (context) => BottomNavBarCubit()),

        /// Auth bloc
        BlocProvider(
          create: (context) => AuthBloc()..add(FetchUserFromFirestore()),
        ),

        /// Home blocs
        BlocProvider(
          create: (context) => HomeBloc()
            ..loadUserToken()
            ..add(FetchProducts())
            ..add(SelectCategory(index: 0)),
        ),

        /// Profile bloc
        BlocProvider(create: (context) => ProfileCubit()),
      ],
      child: const BottomNavBarBody(),
    );
  }
}
