import 'package:boklo_mart/features/home/presentation/widgets/search/item_name_and_description.dart';
import 'package:boklo_mart/features/home/presentation/widgets/search/price_and_sale.dart';
import 'package:boklo_mart/features/home/presentation/widgets/search/product_image.dart';
import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height200,
      width: double.infinity,
      padding: _padding(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.height10),
      ),
      child: Row(
        children: [
          /// product image
          ProductImage(product: product, index: index),
          SizedBox(width: AppDimensions.width15),

          /// product name, description, price and delete button
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // name and description
                ItemNameAndDescription(product: product),
                SizedBox(height: AppDimensions.height50),
                // price and sale
                PriceAndSaleWidget(
                  price: product.price,
                  sale: product.sale,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// padding for the card
  EdgeInsets _padding() {
    return EdgeInsets.only(
      top: AppDimensions.height5,
      bottom: AppDimensions.height5,
      right: AppDimensions.height15,
      left: AppDimensions.height15,
    );
  }

}
