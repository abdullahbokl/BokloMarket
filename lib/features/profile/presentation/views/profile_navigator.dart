import 'package:boklo_mart/features/bottom_navigation_bar/presentation/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:boklo_mart/features/profile/presentation/views/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileNavigator extends StatelessWidget {
  const ProfileNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavBarCubit bottomNavBarCubit = BottomNavBarCubit.get(context);
    return Navigator(
      key: bottomNavBarCubit.profileNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            /// NOTE: Here we can add more routes to navigate inside the profile screen
            switch (settings.name) {
              case '/':
                return const ProfileScreen();
              default:
                return const ProfileScreen();
            }
          },
        );
      },
    );
  }
}
