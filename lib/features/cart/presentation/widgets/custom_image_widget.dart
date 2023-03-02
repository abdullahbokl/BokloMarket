// import 'package:boklo_mart/core/utils/app_assets.dart';
// import 'package:boklo_mart/core/utils/dimensions.dart';
// import 'package:flutter/material.dart';
//
// class CustomImageWidget extends StatelessWidget {
//   const CustomImageWidget({
//     Key? key,
//     this.assetImagePath,
//     this.networkImageUrl,
//     this.imgHeight,
//     this.imgWidth,
//     this.onTap,
//     this.bgColor,
//     this.surroundingBGColor,
//     this.radius,
//     this.surroundingRadius,
//     this.surroundingHeight,
//     this.surroundingWidth,
//   }) : super(key: key);
//
//   final String? assetImagePath;
//   final String? networkImageUrl;
//   final double? imgHeight;
//   final double? imgWidth;
//   final VoidCallback? onTap;
//   final Color? bgColor;
//   final double? radius;
//   final Color? surroundingBGColor;
//   final double? surroundingRadius;
//   final double? surroundingHeight;
//   final double? surroundingWidth;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       /// the surrounding container
//       child: Container(
//         alignment: Alignment.center,
//         height: surroundingHeight,
//         width: surroundingWidth,
//         decoration: BoxDecoration(
//           color: surroundingBGColor,
//           borderRadius: BorderRadius.circular(surroundingRadius ?? 0),
//         ),
//         /// the image
//         child: Container(
//           height: imgHeight ?? Dimensions.height120,
//           width: imgWidth ?? Dimensions.height120,
//           margin: EdgeInsets.only(
//             top: Dimensions.radius10,
//             bottom: Dimensions.radius10,
//             left: Dimensions.radius5,
//             right: Dimensions.radius5,
//           ),
//           decoration: BoxDecoration(
//             color: bgColor,
//             image: DecorationImage(
//               image: _setImage(),
//               fit: BoxFit.fitHeight,
//             ),
//             borderRadius: BorderRadius.circular(radius ?? 0),
//           ),
//         ),
//       ),
//     );
//   }
//
//   ImageProvider _setImage() {
//     if (assetImagePath != null && assetImagePath!.isNotEmpty) {
//       return AssetImage(assetImagePath!);
//     } else if (networkImageUrl != null && networkImageUrl!.isNotEmpty) {
//       return NetworkImage(networkImageUrl!);
//     } else {
//       return const AssetImage(AppImages.emptyImage);
//     }
//   }
// }
