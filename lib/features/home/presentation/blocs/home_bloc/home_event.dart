part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

/// fetch all products
class FetchProducts extends HomeEvent {}

/// category selected
class SelectCategory extends HomeEvent {
  final int index;

  SelectCategory({required this.index});
}

/// search products
class SearchProducts extends HomeEvent {
  final String searchQuery;

  SearchProducts({required this.searchQuery});
}