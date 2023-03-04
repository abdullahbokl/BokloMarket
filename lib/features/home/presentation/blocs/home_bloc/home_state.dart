part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

/// fetch products

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

/// category selected

class CategorySelectedLoading extends HomeState {}

class CategorySelectedSuccess extends HomeState {}

class CategorySelectedEmpty extends HomeState {}

/// search products

class SearchLoading extends HomeState {}

class SearchSuccess extends HomeState {}

class SearchEmpty extends HomeState {}
