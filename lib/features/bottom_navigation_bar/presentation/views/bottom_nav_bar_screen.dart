import 'package:boklo_mart/features/bottom_navigation_bar/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final BottomNavBarCubit bottomNavBarCubit = BottomNavBarCubit.get(context);
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: bottomNavBarCubit.screens[bottomNavBarCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: bottomNavBarCubit.currentIndex,
              items: bottomNavBarCubit.items,
              onTap: (index) => bottomNavBarCubit.currentIndex = index,
              selectedItemColor: Colors.amber[800],
            ),
          ),
        );
      },
    );
  }
}
