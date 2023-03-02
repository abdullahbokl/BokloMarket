import 'package:boklo_mart/features/on_boarding/presentation/cubits/on_boarding_cubit.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < onBoardingCubit.pages.length; i++)
              IndicatorDots(
                isActive: i == onBoardingCubit.currentIndex,
              ),
          ],
        );
      },
    );
  }
}

/// Indicator dot template
class IndicatorDots extends StatelessWidget {
  const IndicatorDots({Key? key, required this.isActive}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.width5),
      width: isActive ? AppDimensions.width12 : AppDimensions.width8,
      height: isActive ? AppDimensions.height12 : AppDimensions.height8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }
}
