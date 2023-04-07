import 'package:boklo_mart/features/details/presentation/widgets/row_of_price_and_cart_button.dart';
import 'package:boklo_mart/features/details/presentation/widgets/product_description.dart';
import 'package:boklo_mart/features/details/presentation/widgets/product_name.dart';
import 'package:boklo_mart/features/details/cubit/details_cubit.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class BottomCurvedPart extends StatelessWidget {
  const BottomCurvedPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailsCubit detailsCubit = DetailsCubit.get(context);

    return Container(
      width: double.maxFinite,
      height: AppDimensions.height / 2.1,
      padding: _padding(),
      decoration: _decoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // name
          const ProductName(),
          SizedBox(height: AppDimensions.height50),
          // description
          const ProductDescription(),
          const Spacer(),
          const RowOfPriceAndCartButton(),
        ],
      ),
    );
  }

  // back ground decoration
  BoxDecoration _decoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppDimensions.radius40),
        topRight: Radius.circular(AppDimensions.radius40),
      ),
    );
  }

  // back ground padding
  EdgeInsets _padding() {
    return EdgeInsets.only(
      top: AppDimensions.height60,
      left: AppDimensions.height35,
      right: AppDimensions.height35,
      bottom: AppDimensions.height20,
    );
  }
}
