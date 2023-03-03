import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:boklo_mart/features/home/presentation/widgets/home_app_bar.dart';
import 'package:boklo_mart/features/home/presentation/widgets/home_drawer.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = HomeBloc.get(context);
    return SafeArea(
      child: Scaffold(
        key: homeBloc.scaffoldKey,
        drawer: const HomeDrawer(),
        body: Padding(
          padding: _padding(),
          child: Column(
            children: const [
              /// custom app bar
              HomeAppBar(),
              // popular items slider
              // const HomeCarouselSlider(),
              // custom app bar
              // home screen
              // Expanded(child: HomeItems()),
            ],
          ),
        ),
      ),
    );

    //     Scaffold(
    //     body: SingleChildScrollView(
    //       child: Container(
    //         padding: EdgeInsets.only(
    //             top: AppAppDimensions.height30,
    //             left: AppAppDimensions.width20,
    //             right: AppAppDimensions.width20),
    //         child: Column(
    //           children: [
    //             const SearchBar(),
    //             SizedBox(height: AppAppDimensions.height30),
    //             const CustomText(
    //               text: "Categories",
    //             ),
    //             SizedBox(height: AppAppDimensions.height30),
    //             _listViewCategory(),
    //             SizedBox(height: AppAppDimensions.height30),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 CustomText(
    //                   text: "Best Selling",
    //                   fontSize: AppAppDimensions.font18,
    //                 ),
    //                 CustomText(
    //                   text: "See all",
    //                   fontSize: AppAppDimensions.font16,
    //                 ),
    //               ],
    //             ),
    //             SizedBox(height: AppAppDimensions.height30),
    //             // _listViewProducts(),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }
    //
    // /// List View Category
    // Widget _listViewCategory() {
    //   return SizedBox(
    //     height: AppAppDimensions.height120,
    //     child: ListView.separated(
    //       itemCount: 10,
    //       scrollDirection: Axis.horizontal,
    //       itemBuilder: (context, index) {
    //         return Column(
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(AppAppDimensions.radius50),
    //                 color: Colors.grey.shade100,
    //               ),
    //               height: 60,
    //               width: 60,
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Image.asset(AppImages.onBoarding1),
    //               ),
    //             ),
    //             const SizedBox(height: 20),
    //             CustomText(
    //               text: "Category Name",
    //             ),
    //           ],
    //         );
    //       },
    //       separatorBuilder: (context, index) => const SizedBox(height: 20),
    //     ),
    //   );
    // }
//
// /// List View Products
// Widget _listViewProducts() {
//   return Container(
//       height: 350,
//       child: ListView.separated(
//         itemCount: controller.productModel.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               /// todo : Navigate to details page
//             },
//             child: Container(
//               width: MediaQuery.of(context).size.width * .4,
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: Colors.grey.shade100,
//                     ),
//                     child: SizedBox(
//                         height: 220,
//                         width: MediaQuery.of(context).size.width * .4,
//                         child: Image.network(
//                           controller.productModel[index].image,
//                           fit: BoxFit.fill,
//                         )),
//                   ),
//                   const SizedBox(height: 20),
//                   CustomText(
//                     text: controller.productModel[index].name,
//                     alignment: Alignment.bottomLeft,
//                   ),
//                   const SizedBox(height: 10),
//                   Expanded(
//                     child: CustomText(
//                       text: controller.productModel[index].description,
//                       color: Colors.grey,
//                       alignment: Alignment.bottomLeft,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   CustomText(
//                     text: "${controller.productModel[index].price} \$",
//                     color: AppColors.primaryColor1,
//                     alignment: Alignment.bottomLeft,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) => const SizedBox(
//           width: 20,
//         ),
//       ),
//   );
// }
  }

  EdgeInsets _padding() {
    return EdgeInsets.only(
      top: AppDimensions.height15,
      left: AppDimensions.width30,
      right: AppDimensions.width30,
      bottom: AppDimensions.height5,
    );
  }
}
