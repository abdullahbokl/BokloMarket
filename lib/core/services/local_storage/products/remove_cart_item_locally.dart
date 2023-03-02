// import 'package:boklo_mart/core/common/models/product_model.dart';
// import 'package:boklo_mart/core/utils/app_strings.dart';
// import 'package:get_storage/get_storage.dart';
//
// class RemoveCartItemLocally {
//   /// Remove Cart Item Locally
//   static Future<ProductModel> removeCartItemsLocally(int index) async {
//     final box = GetStorage();
//     var temp = await box.read(AppStrings.kCartProductsBoxInLocalStorage);
//     /// remove item from list
//     temp.removeAt(index);
//     return ProductModel.fromJson(temp);
//   }
// }
