import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class PriceAndSaleWidget extends StatelessWidget {
  const PriceAndSaleWidget({
    Key? key,
    required this.price,
    required this.sale,
  }) : super(key: key);

  final String price;
  final String? sale;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          text: '\$$price',
          fontSize: sale != null ? AppDimensions.font16 : AppDimensions.font18,
          color: sale != null ? Colors.grey : Colors.black,
          decoration: sale != null ? TextDecoration.lineThrough : null,
        ),
        SizedBox(width: AppDimensions.width15),
        if (sale != null)
          CustomText(
            text: "\$$sale",
            fontSize: AppDimensions.font18,
            fontWeight: FontWeight.bold,
          ),
      ],
    );
  }
}
