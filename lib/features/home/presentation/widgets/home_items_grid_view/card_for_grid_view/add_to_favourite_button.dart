import 'package:boklo_mart/features/home/presentation/widgets/home_items_grid_view/card_for_grid_view/card_decoration.dart';
import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class AddToFavouriteButton extends StatelessWidget {
  const AddToFavouriteButton(
      {Key? key, required this.index, required this.product})
      : super(key: key);

  final int index;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Color? bgColor =
        HomeGridViewCardDecoration().cardColors(index: index, isIcon: true);
    Color? iconColor = HomeGridViewCardDecoration().cardColors(index: index);
    return Align(
      alignment: Alignment.bottomRight,
      child: bgColor != null
          ? CustomButton(
              text: '+',
              size: AppDimensions.font22,
              textColor: iconColor ?? Colors.black,
              color: bgColor,
              width: AppDimensions.width40,
              height: AppDimensions.height35,
              radius: BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.radius20),
                bottomRight: Radius.circular(AppDimensions.radius5),
              ),

              onTap: () {},
            )
          : const SizedBox.shrink(),
    );
  }
}
