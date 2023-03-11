import 'package:boklo_mart/features/auth/presentation/views/sign_in_screen.dart';
import 'package:boklo_mart/features/on_boarding/presentation/widgets/custom_page_view_builder.dart';
import 'package:boklo_mart/features/on_boarding/presentation/widgets/on_boarding_buttons.dart';
import 'package:boklo_mart/features/on_boarding/presentation/widgets/page_indicator.dart';
import 'package:boklo_mart/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingBloc(),
      child: Scaffold(
        body: Container(
          color: AppColors.primaryColor2,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [

                /// page view builder
                CustomPageViewBuilder(),
                Spacer(),

                /// page indicator
                PageIndicator(),
                Spacer(),

                /// on boarding buttons
                OnBoardingButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
