import 'package:boklo_mart/features/bottom_navigation_bar/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavBarCubit bottomNavBarCubit = BottomNavBarCubit.get(context);
    return PersistentTabView(
      context,
      controller: bottomNavBarCubit.tabsController,
      screens: bottomNavBarCubit.screens,
      items: bottomNavBarCubit.items,
      handleAndroidBackButtonPress: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      resizeToAvoidBottomInset: true,
      decoration: NavBarDecoration(
        gradient: AppColors.secondaryGradient(),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radius10),
          topRight: Radius.circular(AppDimensions.radius10),
        ),
      ),
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style4, // Choose the nav bar style with this property.
    );
  }

}
