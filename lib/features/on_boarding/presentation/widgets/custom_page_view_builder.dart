import 'package:boklo_mart/features/on_boarding/presentation/cubits/on_boarding_cubit.dart';
import 'package:boklo_mart/features/on_boarding/presentation/widgets/page_template.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CustomPageViewBuilder extends StatelessWidget {
  const CustomPageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
    return SizedBox(
      height: AppDimensions.height * 0.6,
      child: PageView.builder(
        controller: onBoardingCubit.pageController,
        itemCount: onBoardingCubit.pages.length,
        // onPageChanged: (index) {
        //   onBoardingCubit.changeScreen(index);
        // },
        itemBuilder: (context, index) {
          onBoardingCubit.changeScreen(index);
          return PageTemplate(page: onBoardingCubit.pages[index]);
        },
      ),
    );
  }
}
