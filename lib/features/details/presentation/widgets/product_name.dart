import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/features/details/cubit/details_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProductName extends StatelessWidget {
  const ProductName({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsCubit detailsCubit = DetailsCubit.get(context);
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: detailsCubit.product.name,
              fontSize: AppDimensions.font22,
              fontWeight: FontWeight.bold,
            ),
            const FaIcon(FontAwesomeIcons.bagShopping),
          ],
        );
      },
    );
  }
}
