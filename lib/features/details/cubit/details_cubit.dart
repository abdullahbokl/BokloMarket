import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  /// static instance of the cubit
  static DetailsCubit get(context) => BlocProvider.of(context);

  ProductModel product = ProductModel(
    name: 'item4',
    coverImage: '',
    description: 'adsadsadasd',
    sale: 45,
    price: 5454,
    categories: [
      AppStrings.categories[3],
    ],
  );

  ProductModel get getProduct => product;

  void setProduct(ProductModel product) {
    this.product = product;
    emit(DetailsSuccess());
  }





}
