part of 'on_boarding_bloc.dart';

@immutable
abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingPageChanged extends OnBoardingState {}

class PagePositionChanged extends OnBoardingState {}

class OnBoardingDone extends OnBoardingState {}

