import 'package:boklo_mart/features/home/presentation/widgets/search/custom_search_delegate.dart';
import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// menu button
        GestureDetector(
          onTap: () =>
              HomeBloc.get(context).scaffoldKey.currentState!.openDrawer(),
          child: Container(
            height: AppDimensions.height47,
            width: AppDimensions.width47,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppDimensions.radius10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondaryColor.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child: const Icon(Icons.menu),
          ),
        ),

        /// search button

        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(mainContext: context),
            );
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
