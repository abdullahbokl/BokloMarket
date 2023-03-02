import 'package:boklo_mart/features/on_boarding/presentation/widgets/custom_page_view_builder.dart';
import 'package:boklo_mart/features/on_boarding/presentation/widgets/on_boarding_buttons.dart';
import 'package:boklo_mart/features/on_boarding/presentation/cubits/on_boarding_cubit.dart';
import 'package:boklo_mart/features/on_boarding/presentation/widgets/page_indicator.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// set the height and width of the screen
    AppDimensions.height = MediaQuery.of(context).size.height;
    AppDimensions.width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              /// page view builder
              CustomPageViewBuilder(),

              /// page indicator
              PageIndicator(),
              Spacer(),

              /// on boarding buttons
              OnBoardingButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
