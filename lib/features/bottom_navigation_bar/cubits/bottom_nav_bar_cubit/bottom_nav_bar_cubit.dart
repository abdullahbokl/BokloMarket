import 'package:boklo_mart/features/profile/presentation/views/profile_screen.dart';
import 'package:boklo_mart/features/home/presentation/views/home_screen.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  /// global instance
  static BottomNavBarCubit get(context) => BlocProvider.of(context);

  BottomNavBarCubit() : super(BottomNavBarInitial());

  /// index
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    emit(BottomNavBarIndexChanged());
  }

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
  List<BottomNavigationBarItem> _navItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: Colors.pink,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
        backgroundColor: Colors.pink,
      ),
    ];
  }

  List<BottomNavigationBarItem> get items => _navItems();
}
