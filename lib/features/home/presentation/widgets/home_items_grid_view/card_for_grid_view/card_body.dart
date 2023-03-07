import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:boklo_mart/core/common/widgets/custom_image.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeGridViewCardBody extends StatelessWidget {
  const HomeGridViewCardBody({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _paddingOfItemDetailsColumn(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          CustomText(
            text: product.name,
            color: Colors.black,
            fontSize: AppDimensions.font16,
            fontWeight: FontWeight.w600,
            maxLines: 1,
          ),

          SizedBox(height: AppDimensions.height7),

          /// description
          CustomText(
            text: product.description,
            fontSize: AppDimensions.font14,
            maxLines: 2,
          ),

          /// image of item
          Center(
            child: CustomImage(
              assetImagePath: product.coverImage,
              imgHeight: AppDimensions.height100,
              imgWidth: AppDimensions.width100,
            ),
          ),

          /// item details
          HomeGridViewPriceAndSale(product: product),
        ],
      ),
    );
  }

  /// padding of item details column
  EdgeInsets _paddingOfItemDetailsColumn() {
    return EdgeInsets.only(
      top: AppDimensions.radius15,
      left: AppDimensions.radius15,
      right: AppDimensions.radius15,
      bottom: AppDimensions.radius15,
    );
  }
}

class HomeGridViewPriceAndSale extends StatelessWidget {
  const HomeGridViewPriceAndSale({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.sale != null)
          CustomText(
            text: "\$${product.sale}",
            fontSize: AppDimensions.font18,
            fontWeight: FontWeight.bold,
          ),
        CustomText(
          text: '\$${product.price}',
          fontSize: product.sale != null
              ? AppDimensions.font16
              : AppDimensions.font18,
          color: product.sale != null ? Colors.grey : Colors.black,
          textDecoration: product.sale != null ? TextDecoration.lineThrough : null,
        ),
      ],
    );
  }
}
