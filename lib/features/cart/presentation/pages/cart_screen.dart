// import 'package:boklo_mart/features/cart/controllers/cart_controller.dart';
// import 'package:boklo_mart/features/cart/presentation/pages/empty_screen.dart';
// import 'package:boklo_mart/features/cart/presentation/pages/items_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: GetBuilder<CartController>(
//       init: CartController(),
//       builder: (controller) {
//         if (controller.products.isNotEmpty) {
//           return const ProductsScreen();
//         } else {
//           /// if empty show empty screen
//           return const EmptyScreen();
//         }
//       },
//     )));
//   }
// }
