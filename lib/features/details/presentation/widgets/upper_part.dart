import 'package:boklo_mart/features/details/cubit/details_cubit.dart';
import 'package:boklo_mart/core/common/widgets/custom_image.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class UpperPart extends StatelessWidget {
  const UpperPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailsCubit detailsCubit = DetailsCubit.get(context);
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return Container(
          width: double.maxFinite,
          height: AppDimensions.height / 2,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(bottom: AppDimensions.height100),
          child: CustomImage(
            networkImageUrl: detailsCubit.product.coverImage,
            imgHeight: AppDimensions.height160,
            imgWidth: double.maxFinite,
          ),
        );
      },
    );
  }
}
