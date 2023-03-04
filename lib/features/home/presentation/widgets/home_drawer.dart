import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_assets.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.width / 1.3,
      height: AppDimensions.height / 1.3,
      child: Drawer(
        backgroundColor: Colors.white.withOpacity(0),
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient(),
            borderRadius: BorderRadius.circular(AppDimensions.radius10),
          ),
          child: ListView(
            // padding: EdgeInsets.zero,
            children: [
              SizedBox(height: AppDimensions.height30),
              // logo
              Container(
                width: AppDimensions.width128,
                height: AppDimensions.height128,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  // todo : fetch logo from user
                  AppImages.logo,
                ),
              ),
              SizedBox(height: AppDimensions.height50),
              ListTile(
                onTap: () {
                  /// todo : goto home screen
                },
                leading: const Icon(Icons.home, color: Colors.white),
                title: const CustomText(text: 'Home', color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  /// todo : goto favorites screen
                },
                leading: const Icon(Icons.favorite, color: Colors.white),
                title: const CustomText(text: 'FAVORITES', color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  /// todo : goto profile screen
                },
                leading: const Icon(Icons.account_circle_rounded,
                    color: Colors.white),
                title: const CustomText(text: 'Profile', color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  /// todo : goto settings screen
                },
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const CustomText(text: 'SETTINGS', color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  /// todo : goto help screen
                },
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const CustomText(text: 'SIGN OUT', color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
