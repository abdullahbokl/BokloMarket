import 'package:boklo_mart/core/view_model/auth_view_model.dart';
import 'package:boklo_mart/view/auth/login_page.dart';
import 'package:boklo_mart/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return (user != null ? HomePage() : LoginPage());
  }
}