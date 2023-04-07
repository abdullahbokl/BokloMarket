import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/features/details/cubit/details_cubit.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsCubit detailsCubit = DetailsCubit.get(context);
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return CustomText(
          alignment: Alignment.center,
          color: AppColors.blackHintColor,
          text: detailsCubit.product.description,
          fontSize: AppDimensions.font16,
        );
      },
    );
  }
}
