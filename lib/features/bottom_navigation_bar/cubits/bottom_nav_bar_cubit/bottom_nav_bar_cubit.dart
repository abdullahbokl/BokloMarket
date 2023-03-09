import 'package:boklo_mart/features/bottom_navigation_bar/data/models/bottom_nav_bar_item_model.dart';
import 'package:boklo_mart/features/profile/presentation/views/profile_screen.dart';
import 'package:boklo_mart/features/home/presentation/views/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  /// global instance
  static BottomNavBarCubit get(context) => BlocProvider.of(context);

  BottomNavBarCubit() : super(BottomNavBarInitial());

  /// controllers
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  PersistentTabController get tabsController => _controller;

  /// screens
  final List<Widget> _screens = [
    _widgetWithPadding(const HomeScreen()),
    _widgetWithPadding(const ProfileScreen()),
  ];

  static Widget _widgetWithPadding(Widget widget) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppDimensions.height15,
      ),
      child: widget,
    );
  }

  List<Widget> get screens => _screens;

  /// items
  List<PersistentBottomNavBarItem> _navItems() {
    return [
      BottomNavBarItemModel(
        icon: const Icon(Icons.home),
        title: 'Home',
      ),
      BottomNavBarItemModel(
        icon: const Icon(Icons.person),
        title: 'Profile',
      ),
    ];
  }

  List<PersistentBottomNavBarItem> get items => _navItems();
}
