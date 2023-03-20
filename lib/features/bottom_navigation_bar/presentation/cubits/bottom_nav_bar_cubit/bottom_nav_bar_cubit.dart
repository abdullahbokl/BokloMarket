import 'package:boklo_mart/features/profile/presentation/views/profile_navigator.dart';
import 'package:boklo_mart/features/home/presentation/views/home_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
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

  /// Global navigator keys
  final GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> profileNavigatorKey =
      GlobalKey<NavigatorState>();

  late final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    homeNavigatorKey,
    profileNavigatorKey,
  ];

  /// system back button pressed
  Future<bool> systemBackButtonPressed() async {
    if (_navigatorKeys[_currentIndex].currentState?.canPop() ?? false) {
      _navigatorKeys[_currentIndex]
          .currentState!
          .pop(_navigatorKeys[_currentIndex].currentContext);
      return true;
    } else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      return false;
    }
  }

  /// screens
  final List<Widget> _screens = const [HomeNavigator(), ProfileNavigator()];

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
