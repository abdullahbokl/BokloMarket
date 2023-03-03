import 'package:boklo_mart/features/on_boarding/data/models/page_model.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  const PageTemplate({Key? key, required this.page}) : super(key: key);

  final PageModel page;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.primaryGradient()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            page.image,
            height: AppDimensions.height200,
          ),
          SizedBox(height: AppDimensions.height50),
          CustomText(
            text: page.title,
            color: Colors.white,
            fontSize: AppDimensions.font24,
            alignment: Alignment.center,
          ),
          SizedBox(height: AppDimensions.height20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.width20),
            child: CustomText(
              text: page.desc,
              color: AppColors.greyHintColor,
              fontSize: AppDimensions.font16,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
