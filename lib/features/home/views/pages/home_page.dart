import 'package:boklo_mart/core/common/widgets/search_bar.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  late var Controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: [
                      SearchBar(),
                      const SizedBox(height: 30),
                      const CustomText(
                        text: "Categories",
                      ),
                      const SizedBox(height: 30),
                      // _listViewCategory(),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "See all",
                            fontSize: 16,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      // _listViewProducts(),
                    ],
                  ),
                ),
              ),


    );


  }
  //
  //
  // /// List View Category
  // Widget _listViewCategory() {
  //   return SizedBox(
  //       height: 120,
  //       child: ListView.separated(
  //         itemCount: controller.categoryModel.length,
  //         scrollDirection: Axis.horizontal,
  //         itemBuilder: (context, index) {
  //           return Column(
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(50),
  //                   color: Colors.grey.shade100,
  //                 ),
  //                 height: 60,
  //                 width: 60,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Image.network(controller.categoryModel[index].image),
  //                 ),
  //               ),
  //               const SizedBox(height: 20),
  //               CustomText(
  //                 text: controller.categoryModel[index].name,
  //               ),
  //             ],
  //           );
  //         },
  //         separatorBuilder: (context, index) => const SizedBox(height: 20),
  //       ),
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
