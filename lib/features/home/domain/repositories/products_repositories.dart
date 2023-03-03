import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:boklo_mart/core/services/firebase/products_firestore_services.dart';

class ProductsRepository {

  final ProductsFirestoreServices _productsFirestoreServices = ProductsFirestoreServices();

  /// fetch all products from firestore
  Future<List<ProductModel>> fetchProducts() async {
    try {
      return await _productsFirestoreServices.fetchProducts();
    } catch (e) {
      throw Exception(e.toString());
    }
  }




}