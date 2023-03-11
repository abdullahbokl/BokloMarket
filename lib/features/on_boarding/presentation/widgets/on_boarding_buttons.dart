import 'package:boklo_mart/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:boklo_mart/config/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnBoardingBloc onBoardingBloc = OnBoardingBloc.get(context);
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
              left: AppDimensions.width20,
              right: AppDimensions.width20,
              bottom: AppDimensions.height20),
          child: onBoardingBloc.currentIndex == onBoardingBloc.pages.length - 1

              /// Get Started button
              ? CustomButton(
                  height: AppDimensions.height50,
                  text: 'Get Started',
                  color: AppColors.primaryColor1,
                  onTap: () {
                    onBoardingBloc.add(OnBoardingDoneButtonPressed());
                    Navigator.of(context).pushReplacementNamed(Routes.kSignInRoute);

                  },
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Skip button
                    CustomButton(
                      height: AppDimensions.height50,
                      width: AppDimensions.width100,
                      gradient: AppColors.primaryGradient(),
                      text: 'Skip',
                      onTap: () {
                        onBoardingBloc.add(OnBoardingSkipButtonPressed());
                      },
                    ),

                    /// Next button
                    CustomButton(
                      height: AppDimensions.height50,
                      width: AppDimensions.width100,
                      color: AppColors.primaryColor1,
                      text: 'Next',
                      onTap: () {
                        onBoardingBloc.add(OnBoardingNextButtonPressed());
                      },
                    ),
                  ],
                ),
        );
      },
    );
  }
}
