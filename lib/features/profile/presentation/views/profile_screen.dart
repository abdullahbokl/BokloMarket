import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/features/profile/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/core/utils/app_assets.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/details_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileCubit profileCubit = ProfileCubit.get(context);
    final AuthBloc authBloc = AuthBloc.get(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: _padding(),
          child: Column(
            children: [
              CircleAvatar(
                radius: AppDimensions.radius80,

                /// todo : add user image
                backgroundImage: AssetImage(AppImages.emptyImage),
              ),
              SizedBox(height: AppDimensions.height30),
              DetailsTextField(
                text: 'Abdullah Khaled Elbokl',
                onTap: () {},
              ),
              SizedBox(height: AppDimensions.height20),
              DetailsTextField(
                text: 'email@email.com',
                onTap: () {},
              ),
              SizedBox(height: AppDimensions.height20),
              DetailsTextField(
                text: '**********',
                onTap: () {},
              ),
              SizedBox(height: AppDimensions.height20),
              CustomButton(
                text: 'Update',
                onTap: () {},
              ),
              SizedBox(height: AppDimensions.height20),
              CustomButton(
                text: 'Save',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  EdgeInsets _padding() {
    return EdgeInsets.only(
      top: AppDimensions.height15,
      left: AppDimensions.width30,
      right: AppDimensions.width30,
      bottom: AppDimensions.height5,
    );
  }
}
