import 'dart:async';

import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:boklo_mart/features/on_boarding/data/models/page_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  /// static instance
  static OnBoardingBloc get(context) => BlocProvider.of(context);

  OnBoardingBloc() : super(OnBoardingInitial()) {
    on<OnBoardingEvent>((event, emit) {});

    /// listen to page changes
    on<OnBoardingPageChanging>(_onBoardingPageChange);

    /// listen to next button pressed
    on<OnBoardingNextButtonPressed>(_onBoardingNextButtonPressed);

    /// listen to skip button pressed
    on<OnBoardingSkipButtonPressed>(_onBoardingSkipButtonPressed);

    /// change position of page indicator
    on<OnBoardingPageIndicatorPositionChange>(_onBoardingPageIndicatorChange);

    /// listen to get started button pressed
    on<OnBoardingDoneButtonPressed>(_onBoardingDoneButtonPressed);
  }

  /// data
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

  /// controllers
  final PageController pageController = PageController();

  /// variables
  int currentIndex = 0;
  double pageIndicatorPosition = 0.0;

  /// change page
  _onBoardingPageChange(
      OnBoardingPageChanging event, Emitter<OnBoardingState> emit) {
    currentIndex = event.index;
    emit(OnBoardingPageChanged());
  }

  /// next button pressed
  FutureOr<void> _onBoardingNextButtonPressed(
      OnBoardingNextButtonPressed event, Emitter<OnBoardingState> emit) {
    currentIndex++;
    pageController.nextPage(
        duration: const Duration(milliseconds: 600), curve: Curves.ease);
    emit(OnBoardingPageChanged());
  }

  /// skip button pressed
  FutureOr<void> _onBoardingSkipButtonPressed(
      OnBoardingSkipButtonPressed event, Emitter<OnBoardingState> emit) {
    currentIndex = pages.length - 1;
    pageController.jumpToPage(currentIndex);
    emit(OnBoardingPageChanged());
  }

  Future<FutureOr<void>> _onBoardingDoneButtonPressed(
      event, Emitter<OnBoardingState> emit) async {
    var box = Hive.box(AppStrings.kOnBoardingBox);
    box.put(AppStrings.kOnBoardingBox, true);
    emit(OnBoardingPageChanged());
  }

  FutureOr<void> _onBoardingPageIndicatorChange(
      OnBoardingPageIndicatorPositionChange event, Emitter<OnBoardingState> emit) {
    pageIndicatorPosition = pageController.page ?? 0.0;
    emit(OnBoardingDone());
  }
}
