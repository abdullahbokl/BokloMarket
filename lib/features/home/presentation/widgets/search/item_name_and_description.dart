import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class ItemNameAndDescription extends StatelessWidget {
  const ItemNameAndDescription({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// product name
        CustomText(
          text: product.name,
          fontSize: AppDimensions.font18,
          fontWeight: FontWeight.bold,
          alignment: Alignment.centerLeft,
        ),
        SizedBox(height: AppDimensions.height7),
        /// product description
        CustomText(
          text: product.description,
          fontSize: AppDimensions.font16,
          color: Colors.grey,
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}
