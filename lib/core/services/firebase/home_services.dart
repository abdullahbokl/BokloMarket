import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
  FirebaseFirestore.instance.collection(AppStrings.kCategoriesCollection);
  final CollectionReference _productCollectionRef =
  FirebaseFirestore.instance.collection(AppStrings.kProductsCollection);

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productCollectionRef.get();

    return value.docs;
  }
}
