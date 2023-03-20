import 'package:boklo_mart/features/bottom_navigation_bar/presentation/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:boklo_mart/features/home/presentation/views/home_screen.dart';
import 'package:boklo_mart/config/routes/routes.dart';
import 'package:flutter/material.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavBarCubit bottomNavBarCubit = BottomNavBarCubit.get(context);
    return Navigator(
      key: bottomNavBarCubit.homeNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case Routes.kHomeRoute:
                return const HomeScreen();
              default:
                return const HomeScreen();
            }
          },
        );
      },
    );
  }
}
