import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesButtonsRow extends StatelessWidget {
  const CategoriesButtonsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = HomeBloc.get(context);
    return SizedBox(
      height: AppDimensions.height50,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: AppStrings.categories.length,
            separatorBuilder: (context, index) =>
                SizedBox(width: AppDimensions.width5),
            itemBuilder: (context, index) {
              return CustomButton(
                gradient: homeBloc.selectedCategoryIndex == index
                    ? AppColors.secondaryGradient()
                    : null,
                color: Colors.grey[200],
                textColor: homeBloc.selectedCategoryIndex == index
                    ? Colors.white
                    : Colors.black,
                radius: AppDimensions.radius50,
                width: AppDimensions.width100,
                text: AppStrings.categories[index],
                onTap: () {
                  homeBloc.add(SelectCategory(index: index));
                },
              );
            },
          );
        },
      ),
    );
  }
}

