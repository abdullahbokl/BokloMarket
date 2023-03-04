import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:boklo_mart/core/common/widgets/custom_image.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomImage(
      networkImageUrl: product.coverImage,
      imgHeight: AppDimensions.height150,
      imgWidth: AppDimensions.width150,
      surroundingBGColor:
          index.isEven ? AppColors.primaryColor1 : AppColors.primaryColor2,
      surroundingHeight: AppDimensions.height160,
      surroundingWidth: AppDimensions.width160,
      surroundingRadius: AppDimensions.height25,
    );
  }
}
