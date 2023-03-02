// import 'package:boklo_mart/core/common/widgets/big_text.dart';
// import 'package:boklo_mart/core/utils/app_assets.dart';
// import 'package:boklo_mart/core/utils/dimensions.dart';
// import 'package:boklo_mart/features/cart/presentation/widgets/custom_image_widget.dart';
// import 'package:flutter/material.dart';
//
// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//     required this.onTap,
//     required this.text,
//   });
//
//   final VoidCallback onTap;
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: Dimensions.width15,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           BigText(
//             text: text,
//             size: Dimensions.font20,
//             fontWeight: FontWeight.w800,
//           ),
//           CustomImageWidget(
//             onTap: onTap,
//             assetImagePath: AppImages.shopIcon,
//             imgHeight: Dimensions.height25,
//             imgWidth: Dimensions.width22,
//           ),
//         ],
//       ),
//     );
//   }
// }
