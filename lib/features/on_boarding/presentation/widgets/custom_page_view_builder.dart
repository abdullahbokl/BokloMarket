import 'package:boklo_mart/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:boklo_mart/features/on_boarding/presentation/widgets/page_template.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CustomPageViewBuilder extends StatelessWidget {
  const CustomPageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnBoardingBloc onBoardingBloc = OnBoardingBloc.get(context);
    return SizedBox(
      height: AppDimensions.height * 0.6,
      child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
          return PageView(
            controller: onBoardingBloc.pageController,
            onPageChanged: (index) {
              onBoardingBloc.add(OnBoardingPageChanging(index: index));
            },
            children: [
              for (int i = 0; i < onBoardingBloc.pages.length; i++)
                PageTemplate(
                  page: onBoardingBloc.pages[i],
                ),
            ],
          );
        },
      ),
    );
  }
}
