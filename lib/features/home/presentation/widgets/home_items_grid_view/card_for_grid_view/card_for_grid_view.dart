import 'package:boklo_mart/features/home/presentation/widgets/home_items_grid_view/card_for_grid_view/card_decoration.dart';
import 'package:boklo_mart/features/home/presentation/widgets/home_items_grid_view/card_for_grid_view/card_body.dart';
import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

import 'add_to_favourite_button.dart';

class HomeGridViewCard extends StatelessWidget {
  const HomeGridViewCard({
    Key? key,
    required this.product,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final ProductModel product;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      /// white parent to avoid shadow and background color overlapping
      decoration: _cardShadow(),
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: HomeGridViewCardDecoration()
                  .decoration(index: index, context: context),
              child: HomeGridViewCardBody(product: product),
            ),
          ),
          AddToCartButton(index: index, product: product),
        ],
      ),
    );
  }

  /// card shadow
  BoxDecoration _cardShadow() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppDimensions.radius5),
      boxShadow: HomeGridViewCardDecoration()
                  .cardColors(index: index, isShadow: true) !=
              null
          ? [
              BoxShadow(
                // blurStyle: ,
                color: HomeGridViewCardDecoration()
                    .cardColors(index: index, isShadow: true)
                    .withOpacity(0.24),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ]
          : null,
    );
  }
}

/// button to go to details page
