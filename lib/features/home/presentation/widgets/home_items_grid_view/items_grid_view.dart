import 'package:boklo_mart/config/routes/routes.dart';
import 'package:boklo_mart/features/details/cubit/details_cubit.dart';
import 'package:boklo_mart/features/home/presentation/widgets/home_items_grid_view/card_for_grid_view/card_for_grid_view.dart';
import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = HomeBloc.get(context);
    DetailsCubit detailsCubit = DetailsCubit.get(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: AppDimensions.itemCardRatio,
            mainAxisSpacing: AppDimensions.height10,
            crossAxisSpacing: AppDimensions.width10,
          ),
          itemCount: homeBloc.categorizedProducts.length,
          itemBuilder: (context, index) {
            return HomeGridViewCard(
              product: homeBloc.categorizedProducts[index],
              index: index,
              onTap: () {
                detailsCubit.product = homeBloc.categorizedProducts[index];
                Navigator.pushNamed(
                  context,
                  Routes.kProductDetailsScreen,
                );
              },
            );
          },
        );
      },
    );
  }
}
