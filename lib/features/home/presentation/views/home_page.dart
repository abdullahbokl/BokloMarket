import 'package:boklo_mart/features/home/presentation/widgets/categories_buttons_row/categories_buttons_row.dart';
import 'package:boklo_mart/features/home/presentation/widgets/categories_buttons_row/items_grid_view.dart';
import 'package:boklo_mart/features/home/presentation/widgets/random_items_slider.dart';
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
            children: [
              /// custom app bar
              const HomeAppBar(),
              SizedBox(height: AppDimensions.height20),
              /// body
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // random items slider
                      const ImagesSlider(),
                      SizedBox(height: AppDimensions.height20),
                      const CategoriesButtonsRow(),
                      SizedBox(height: AppDimensions.height20),
                      const ItemsGridView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
