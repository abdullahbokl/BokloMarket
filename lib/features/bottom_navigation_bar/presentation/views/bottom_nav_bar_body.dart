import 'package:boklo_mart/features/bottom_navigation_bar/presentation/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class BottomNavBarBody extends StatelessWidget {
  const BottomNavBarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavBarCubit bottomNavBarCubit = BottomNavBarCubit.get(context);
    return SafeArea(
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: bottomNavBarCubit.systemBackButtonPressed,
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: bottomNavBarCubit.currentIndex,
                items: bottomNavBarCubit.items,
                onTap: (index) => bottomNavBarCubit.currentIndex = index,
                selectedItemColor: Colors.amber[800],
              ),
              body: IndexedStack(
                index: bottomNavBarCubit.currentIndex,
                children: bottomNavBarCubit.screens,
              ),
            ),
          );
        },
      ),
    );
  }
}
