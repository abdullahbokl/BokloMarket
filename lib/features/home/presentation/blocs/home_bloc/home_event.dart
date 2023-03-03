part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

/// fetch products
class FetchProducts extends HomeEvent {}

class SearchProducts extends HomeEvent {
  final String searchQuery;

  SearchProducts({required this.searchQuery});
}