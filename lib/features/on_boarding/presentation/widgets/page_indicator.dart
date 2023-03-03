import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:boklo_mart/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnBoardingBloc onBoardingBloc = OnBoardingBloc.get(context);
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        return DotsIndicator(
          dotsCount: onBoardingBloc.pages.length,
          position: onBoardingBloc.currentIndex.toDouble(),
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor1,
            size: Size.square(AppDimensions.height10),
            activeSize: Size(AppDimensions.width20, AppDimensions.height10),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radius5)),
          ),
        );
      },
    );
  }
}
