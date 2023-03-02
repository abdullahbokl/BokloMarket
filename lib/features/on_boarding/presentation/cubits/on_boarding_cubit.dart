import 'package:boklo_mart/features/on_boarding/data/models/page_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  /// static instance
  static OnBoardingCubit get(context) => BlocProvider.of(context);

  /// variables
  int currentIndex = 0;

  /// controllers
  final PageController pageController = PageController();

  final List<PageModel> pages = [
    PageModel(
      title: 'Welcome to Boklo Market',
      desc:
          'Boklo Market is a platform that connects you to the best sellers in your area',
      image: 'assets/images/on_boarding/on_boarding1.png',
      currentIndex: 0,
    ),
    PageModel(
      title: 'Buy and Sell',
      desc: 'Buy and sell your products with ease',
      image: 'assets/images/on_boarding/on_boarding2.png',
      currentIndex: 1,
    ),
    PageModel(
      title: 'Get the best deals',
      desc: 'Get the best deals from the best sellers in your area',
      image: 'assets/images/on_boarding/on_boarding3.png',
      currentIndex: 2,
    ),
  ];

  //Lets write function to change next on boarding screen
  void changeScreen(int newIndex) {
    if (currentIndex < newIndex) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    } else if (currentIndex < newIndex) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }
    currentIndex = newIndex;
    emit(OnBoardingPageChanged());
  }

  void saveOnBoarding() {
    /// save using hive
  }
}
