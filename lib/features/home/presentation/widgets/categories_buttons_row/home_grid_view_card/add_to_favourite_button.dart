import 'package:boklo_mart/features/home/presentation/widgets/categories_buttons_row/home_grid_view_card/card_decoration.dart';
import 'package:boklo_mart/core/common/widgets/custom_icon_button_widget.dart';
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
          ? CustomIconButtonWidget(
        height: AppDimensions.height35,
        width: AppDimensions.width35,
        bgColor: bgColor,
        onTap: () {},
      )
          : CustomIconButtonWidget(
        icon: Icon(Icons.favorite_border, color: iconColor),
        onTap: () {},
      ),
    );
  }
}
