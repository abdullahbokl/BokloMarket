import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_assets.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = AuthBloc.get(context);
    HomeBloc homeBloc = HomeBloc.get(context);
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
                width: AppDimensions.width150,
                height: AppDimensions.height150,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor1.withOpacity(0.7),

                ),
                child: Image.asset(
                  // todo : fetch logo from user
                  AppImages.emptyImage,
                  fit: BoxFit.fitHeight,
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
                  authBloc.add(SignOut());
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
