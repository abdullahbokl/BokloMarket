import 'package:boklo_mart/features/home/presentation/widgets/search/search_card.dart';
import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class ImagesSlider extends StatelessWidget {
  const ImagesSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = HomeBloc.get(context);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: AppDimensions.height200,
              child: Swiper(
                autoplay: true,
                itemCount: homeBloc.randomProducts.length,
                viewportFraction: 1,
                scale: 0.3,
                itemBuilder: (BuildContext context, int index) {
                  return ListCard(
                    product: homeBloc.randomProducts[index],
                    index: index,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
