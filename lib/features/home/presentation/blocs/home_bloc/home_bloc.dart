import 'dart:async';

import 'package:boklo_mart/features/home/domain/repositories/products_repositories.dart';
import 'package:boklo_mart/core/services/firebase/auth_firestore_services.dart';
import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// static instance
  static HomeBloc get(context) => BlocProvider.of(context);

  /// events
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});

    /// fetch products
    on<FetchProducts>(_fetchProducts);

    /// search event
    on<SearchProducts>(_searchProducts);
  }

  /// repositories
  final ProductsRepository _productsRepository = ProductsRepository();

  /// controllers and global keys
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// variables
  // all products
  List<ProductModel> _allProducts = [];

  List<ProductModel> get allProducts => _allProducts;

  // filterd products
  List<ProductModel> _filterdProducts = [];

  List<ProductModel> get filterdProducts => _filterdProducts;

  /// fetch products
  void _fetchProducts(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      _allProducts = await _productsRepository.fetchProducts();
      emit(HomeSuccess());
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  /// load user token
  void loadUserToken() async {
    AppStrings.userToken = await AuthFirestoreServices.getUserTokenId();
  }

  FutureOr<void> _searchProducts(
      SearchProducts event, Emitter<HomeState> emit) {
    emit(SearchLoading());
    _filterdProducts = _allProducts
        .where((product) => product.name
            .toLowerCase()
            .contains(event.searchQuery.trim().toLowerCase()))
        .toList();
    if (_filterdProducts.isNotEmpty) {
      emit(SearchSuccess());
    } else {
      SearchEmpty();
    }
  }
}
