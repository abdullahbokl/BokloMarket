// import 'package:boklo_mart/config/routes/app_router.dart';
// import 'package:boklo_mart/core/common/widgets/big_text.dart';
// import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
// import 'package:boklo_mart/core/common/widgets/small_text.dart';
// import 'package:boklo_mart/core/utils/app_assets.dart';
// import 'package:boklo_mart/core/utils/dimensions.dart';
// import 'package:boklo_mart/features/control/controllers/control_controller.dart';
// import 'package:boklo_mart/features/home/views/pages/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class EmptyScreen extends StatelessWidget {
//   const EmptyScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: Dimensions.height,
//       width: Dimensions.width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: Dimensions.height167,
//             width: Dimensions.width125,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(AppImages.emptyImage),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(height: Dimensions.height22),
//           BigText(
//             text: 'Your Wishlist is Empty',
//             size: Dimensions.font18,
//             fontWeight: FontWeight.bold,
//           ),
//           SizedBox(height: Dimensions.height10),
//           SmallText(
//             text: "Seems like you don’t have wishes here.\nMake a wish!",
//             size: Dimensions.font14,
//             color: Colors.black54,
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: Dimensions.height20),
//           CustomButton(
//             text: 'Make a Wish',
//             size: Dimensions.font16,
//             onTap: () {
//               /// got to home screen
//               ControlController controlController = Get.find();
//               controlController.changeSelectedValue(0);
//             },
//             height: Dimensions.height40,
//             width: Dimensions.width115,
//             /// gradient: AppColors.gradient,
//           ),
//         ],
//       ),
//     );
//   }
//
// }
