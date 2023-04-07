import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/features/details/cubit/details_cubit.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class RowOfPriceAndCartButton extends StatelessWidget {
  const RowOfPriceAndCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsCubit detailsCubit = DetailsCubit.get(context);

    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: '\$ ${detailsCubit.product.price}',
              fontSize: AppDimensions.font20,
              fontWeight: FontWeight.w800,
            ),
            CustomButton(
              text: 'Add to cart',
              width: AppDimensions.width150,
              gradient: AppColors.secondaryGradient(),
              suffixIcon: Icons.add_shopping_cart_sharp,
              suffixIconColor: Colors.white,
              size: AppDimensions.font18,
              suffixIconSize: AppDimensions.font22,
              onTap: () {
                /// todo : add to cart
              },
            ),
          ],
        );
      },
    );
  }
}
