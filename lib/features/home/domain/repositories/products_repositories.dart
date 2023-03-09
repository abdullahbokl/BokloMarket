import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsRepository {
  /// fetch all products from firestore
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final productsDocs = await FirebaseFirestore.instance
          .collection(AppStrings.kProductsCollection)
          .get();
      return productsDocs.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
