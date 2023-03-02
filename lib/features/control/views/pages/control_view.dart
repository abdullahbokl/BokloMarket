// import 'package:boklo_mart/core/utils/app_assets.dart';
// import 'package:boklo_mart/core/utils/dimensions.dart';
// import 'package:boklo_mart/features/control/controllers/control_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ControlView extends GetWidget<ControlController> {
//   @override
//
//   final ControlController controller = Get.find();
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<ControlController>(
//           builder: (controller) {
//             return controller.currentScreen;
//           }),
//       bottomNavigationBar: bottomNavigationBar(),
//     );
//   }
//
//   Widget bottomNavigationBar() {
//     return BottomNavigationBar(
//       items: [
//         _bottomNavigationBarItem(
//             text: "Explore", image: AppImages.Icon_Explore),
//         _bottomNavigationBarItem(text: "Cart", image: AppImages.icon_Cart),
//         _bottomNavigationBarItem(text: "Account", image: AppImages.Icon_User),
//       ],
//       currentIndex: controller.navigatorValue,
//       onTap: (index) {
//         controller.changeSelectedValue(index);
//       },
//       elevation: 0,
//       selectedItemColor: Colors.black,
//       backgroundColor: Colors.grey.shade50,
//     );
//   }
//
//   /// Bottom Navigation Bar Item
//   BottomNavigationBarItem _bottomNavigationBarItem(
//       {required String text, required String image}) {
//     return BottomNavigationBarItem(
//         activeIcon: Padding(
//           padding: EdgeInsets.only(top: Dimensions.height10),
//           child: Text(text),
//         ),
//         label: '',
//         icon: Padding(
//           padding: EdgeInsets.only(top: Dimensions.height20),
//           child: Image.asset(
//             image,
//             fit: BoxFit.contain,
//             width: Dimensions.width20,
//           ),
//         ));
//   }
// }
