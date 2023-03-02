// import 'package:boklo_mart/core/common/models/product_model.dart';
// import 'package:boklo_mart/core/utils/dimensions.dart';
// import 'package:boklo_mart/features/cart/controllers/cart_controller.dart';
// import 'package:boklo_mart/features/cart/presentation/widgets/custom_app_bar_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProductsScreen extends StatelessWidget {
//   const ProductsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       GetBuilder<CartController>(
//         init: CartController(),
//         builder: (controller) =>
//             Padding(
//               padding: _padding(),
//               child: Column(
//                 children: [
//                   // custom app bar
//                   CustomAppBar(
//                     text: 'Wishlist',
//                     onTap: () {
//                       /// todo : navigate to cart page
//                     },
//                   ),
//                   SizedBox(height:
//                   Dimensions.height50),
//                   // search bar
//                   /// todo add  searchBar,
//                   SizedBox(height: Dimensions.height40),
//                   // list of items
//                   _buildListView(controller.filterdProducts),
//                 ],
//               ),
//             ),
//       );
//
//   }
//
//   /// padding for the screen
//   EdgeInsets _padding() {
//     return EdgeInsets.only(
//       top: Dimensions.height60,
//       bottom: Dimensions.radius20,
//       right: Dimensions.width15,
//       left: Dimensions.width15,
//     );
//   }
//
//   /// build list of items
//   _buildListView(List<ProductModel> products) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               /// todo : navigate to product details page
//             },
//             // child: CustomCardWidget(
//             //   index: index, product: products[index],
//             // ),
//           );
//         },
//       ),
//     );
//   }
// }
