import 'package:boklo_mart/features/home/domain/repositories/products_repositories.dart';
import 'package:boklo_mart/core/services/firebase/auth_firestore_services.dart';
import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

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

    /// category selected
    on<SelectCategory>(_categorySelected);

    /// search event
    on<SearchProducts>(_searchProducts);

  }

  /// repositories
  final ProductsRepository _productsRepository = ProductsRepository();

  /// controllers and global keys
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// variables
  // all products
  List<ProductModel> _allProducts = [
    ProductModel(
      name: 'item1',
      coverImage: '',
      description: 'adsadsadasd',
      sale: 45,
      price: 5454,
      categories: [
        AppStrings.categories[0],
      ],
    ),
    ProductModel(
      name: 'item2',
      coverImage: '',
      description: 'adsadsadasd',
      sale: 45,
      price: 5454,
      categories: [
        AppStrings.categories[1],
      ],
    ),
    ProductModel(
      name: 'item3',
      coverImage: '',
      description: 'adsadsadasd',
      sale: 45,
      price: 5454,
      categories: [
        AppStrings.categories[2],
      ],
    ),
    ProductModel(
      name: 'item4',
      coverImage: '',
      description: 'adsadsadasd',
      sale: 45,
      price: 5454,
      categories: [
        AppStrings.categories[3],
      ],
    ),
    ProductModel(
      name: 'item5',
      coverImage: '',
      description: 'adsadsadasd',
      sale: 45,
      price: 5454,
      categories: [
        AppStrings.categories[4],
      ],
    ),
    ProductModel(
      name: 'item6',
      coverImage: '',
      description: 'adsadsadasd',
      sale: 45,
      price: 5454,
      categories: [
        AppStrings.categories[5],
      ],
    ),
    ProductModel(
      name: 'ssssssitem6ssssssitem6',
      coverImage: '',
      description: 'sssssssadsadsadasdsssssssadsadsadasdsssssssadsadsadasd',
      sale: 45,
      price: 5454,
      categories: [
        AppStrings.categories[5],
      ],
    ),

  ];

  List<ProductModel> get allProducts => _allProducts;

  // random products
  List<ProductModel> _randomProducts = [];

  List<ProductModel> get randomProducts => _randomProducts;

  // products according to category
  List<ProductModel> _categorizedProducts = [];

  List<ProductModel> get categorizedProducts => _categorizedProducts;

  // filterd products
  List<ProductModel> _filterdProducts = [];

  List<ProductModel> get filterdProducts => _filterdProducts;

  // selected category index
  int selectedCategoryIndex = 0;

  /// methods

  /// load user token
  Future<void> loadUserToken() async {
    AppStrings.userToken = await AuthFirestoreServices.getUserTokenId();
  }

  /// fetch products
  void _fetchProducts(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      // all products
      // _allProducts = await _productsRepository.fetchProducts();

      // random products
      _generateRandomProducts();

      emit(HomeSuccess());
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  /// generate random products
  _generateRandomProducts() {
    _randomProducts = [];
    Random random = Random();
    int numElements = _allProducts.length >= 4 ? 4 : _allProducts.length;
    for (int i = 0; i < numElements; i++) {
      while (true) {
        int randomIndex = random.nextInt(_allProducts.length);
        if (!_randomProducts.contains(_allProducts[randomIndex])) {
          _randomProducts.add(_allProducts[randomIndex]);
          break;
        }
      }
    }
  }

  /// products according to category
  void _categorySelected(SelectCategory event, Emitter<HomeState> emit) {
    selectedCategoryIndex = event.index;
    emit(CategorySelectedLoading());
    if (selectedCategoryIndex == 0) {
      _categorizedProducts = _allProducts;
    } else {
      _categorizedProducts = _allProducts
          .where((product) => product.categories.contains(
              AppStrings.categories[selectedCategoryIndex]))
          .toList();
    }
    if (_categorizedProducts.isNotEmpty) {
      emit(CategorySelectedSuccess());
    } else {
      emit(CategorySelectedEmpty());
    }
  }

  /// search products
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
      emit(SearchEmpty());
    }
  }

}
