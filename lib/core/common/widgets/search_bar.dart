// import 'package:flutter/material.dart';
//
// class SearchBar extends StatelessWidget {
//   const SearchBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.grey.shade200,
//       ),
//       child: TextFormField(
//         decoration: const InputDecoration(
//           border: InputBorder.none,
//           prefixIcon: Icon(
//             Icons.search,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: AppDimensions.height50,
      child: TextFormField(
        // controller: _searchController,
        onChanged: (value) {
          /// todo : filter items
        },
        decoration: InputDecoration(
          // prefix icon
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.blackHintColor,
          ),
          // hint
          hintText: 'Search your wishlist products',
          hintStyle: const TextStyle(color: AppColors.blackHintColor),
          // border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius15),
            borderSide: const BorderSide(
              color: AppColors.primaryColor1,
            ),
          ),
        ),
      ),
    );
  }
}
