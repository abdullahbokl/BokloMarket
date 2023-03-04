import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:boklo_mart/features/home/presentation/widgets/categories_buttons_row/home_grid_view_card/home_grid_view_card.dart';
import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ItemsGridView extends StatelessWidget {
  const ItemsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = HomeBloc.get(context);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: AppDimensions.height10,
            crossAxisSpacing: AppDimensions.width10,
          ),
          itemCount: homeBloc.categorizedProducts.length,
          itemBuilder: (context, index) {
            return HomeGridViewCard(
              product: homeBloc.categorizedProducts[index],
              index: index,
            );
          },
        );
      },
    );
  }
}