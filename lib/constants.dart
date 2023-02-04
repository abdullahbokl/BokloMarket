import 'package:boklo_mart/view/auth/login_page.dart';
import 'package:boklo_mart/view/auth/register_page.dart';
import 'package:boklo_mart/view/control_view.dart';
import 'package:boklo_mart/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


const kPrimaryColor = Color.fromRGBO(0, 197, 105, 1);


  /** firebase **/

// collections names
const String kUserCollection = 'users';
const String kCategoriesCollection = 'categories';
const String kProductsCollection = 'products';



  /** routes names **/
const String kLoginRoute = '/login';
const String kRegisterRoute = '/signUp';
const String kHomeRoute = '/home';
const String kControlRoute = '/control';


List<GetPage<dynamic>>? routes = [
  GetPage(name: kControlRoute, page: () => ControlView()),
  GetPage(name: kLoginRoute, page: () => LoginPage()),
  GetPage(name: kRegisterRoute, page: () => RegisterPage()),
  GetPage(name: kHomeRoute, page: () => HomePage()),
];
