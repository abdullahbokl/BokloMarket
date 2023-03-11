import 'package:boklo_mart/features/home/presentation/widgets/home_items_grid_view/items_grid_view.dart';
import 'package:boklo_mart/features/home/presentation/widgets/categories_buttons_row.dart';
import 'package:boklo_mart/features/home/presentation/widgets/random_items_slider.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:boklo_mart/features/home/presentation/widgets/home_app_bar.dart';
import 'package:boklo_mart/features/home/presentation/widgets/home_drawer.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/config/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = HomeBloc.get(context);

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          Navigator.of(context).pushReplacementNamed(Routes.kSignInRoute);
        }
      },
      builder: (context, state) {
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
      },
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
