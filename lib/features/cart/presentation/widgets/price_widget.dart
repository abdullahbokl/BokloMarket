// import 'package:boklo_mart/core/common/widgets/big_text.dart';
// import 'package:boklo_mart/core/utils/dimensions.dart';
// import 'package:flutter/material.dart';
//
// class PriceWidget extends StatelessWidget {
//   const PriceWidget({
//     Key? key,
//     required this.price,
//     required this.sale,
//   }) : super(key: key);
//
//   final String price;
//   final String? sale;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         BigText(
//           text: '\$${price}',
//           size: sale != null ? Dimensions.font16 : Dimensions.font18,
//           color: sale != null ? Colors.grey : Colors.black,
//           decoration: sale != null ? TextDecoration.lineThrough : null,
//         ),
//         SizedBox(width: Dimensions.width15),
//         if (sale != null)
//           BigText(
//             text: "\$${sale}",
//             size: Dimensions.font18,
//             fontWeight: FontWeight.bold,
//           ),
//       ],
//     );
//   }
// }
