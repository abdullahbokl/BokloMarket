part of 'on_boarding_bloc.dart';

@immutable
abstract class OnBoardingEvent {}

class OnBoardingPageChanging extends OnBoardingEvent {
  final int index;

  OnBoardingPageChanging({required this.index});
}

class OnBoardingNextButtonPressed extends OnBoardingEvent {}

class OnBoardingSkipButtonPressed extends OnBoardingEvent {}

class OnBoardingDoneButtonPressed extends OnBoardingEvent {}

class OnBoardingPageIndicatorPositionChange extends OnBoardingEvent {}