import 'package:boklo_mart/view/cart_view.dart';
import 'package:boklo_mart/view/home_page.dart';
import 'package:boklo_mart/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = HomePage();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomePage();
          break;
        }
      case 1:
        {
          currentScreen = CartView();
          break;
        }
      case 2:
        {
          currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}