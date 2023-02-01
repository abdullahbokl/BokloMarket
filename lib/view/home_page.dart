import 'package:boklo_mart/constants.dart';
import 'package:boklo_mart/core/view_model/auth_view_model.dart';
import 'package:boklo_mart/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<AuthViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 20),
          child: SingleChildScrollView(
            child: LimitedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _searchBox(),
                  const SizedBox(height: 50),
                  const CustomText(text: 'Categories'),
                  const SizedBox(height: 50),
                  _categoriesListView(),
                  const SizedBox(height: 50),
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
                  const SizedBox(height: 50),
                  _productsListView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _searchBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  Container _categoriesListView() {
    return Container(
      height: 100,
      child: ListView.separated(
        itemCount: 50,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade100,
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/Icon_Mens Shoe.png"),
                ),
              ),
              const SizedBox(height: 20),
              const CustomText(text: 'data'),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
      ),
    );
  }

  _productsListView() {
    return Container(
      height: 350,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100,
                    ),
                    child: Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Image.asset(
                          "assets/images/chaire.png",
                          fit: BoxFit.fill,
                        )),
                  ),
                  const SizedBox(height: 20),
                  const CustomText(
                    text: 'data',
                    alignment: Alignment.bottomLeft,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Expanded(
                    child: CustomText(
                      text: "data",
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomText(
                    text: '\$data',
                    color: kPrimaryColor,
                    alignment: Alignment.bottomLeft,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
      ),
    );
  }
}
