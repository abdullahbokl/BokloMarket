import 'package:boklo_mart/core/services/home_services.dart';
import 'package:boklo_mart/model/category_model.dart';
import 'package:boklo_mart/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  RxBool get loading => _loading;
  final RxBool _loading = false.obs;

  RxList get categoryModel => _categoryModel;
  final RxList<CategoryModel> _categoryModel = <CategoryModel>[].obs;

  RxList get productModel => _productModel;
  final RxList<ProductModel> _productModel = <ProductModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getCategory();
    await getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value = false;
      }
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
    });
  }
}
