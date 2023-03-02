import 'package:boklo_mart/features/on_boarding/presentation/cubits/on_boarding_cubit.dart';
import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
              left: AppDimensions.width20,
              right: AppDimensions.width20,
              bottom: AppDimensions.height20),
          child:
              onBoardingCubit.currentIndex == onBoardingCubit.pages.length - 1

                  /// Get Started button
                  ? CustomButton(
                      text: 'Get Started',
                      onTap: () {
                        onBoardingCubit.saveOnBoarding();
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Skip button
                        CustomButton(
                          height: 50,
                          width: 100,
                          text: 'Skip',
                          onTap: () {
                            onBoardingCubit
                                .changeScreen(onBoardingCubit.pages.length - 1);
                          },
                        ),

                        /// Next button
                        CustomButton(
                          height: 50,
                          width: 100,
                          text: 'Next',
                          onTap: () {
                            int newIndex = onBoardingCubit.currentIndex + 1;
                            onBoardingCubit.changeScreen(newIndex);

                          },
                        ),
                      ],
                    ),
        );
      },
    );
  }
}
