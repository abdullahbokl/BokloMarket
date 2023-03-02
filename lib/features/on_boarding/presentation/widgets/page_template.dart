import 'package:boklo_mart/features/on_boarding/data/models/page_model.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  const PageTemplate({Key? key, required this.page}) : super(key: key);

  final PageModel page;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          page.image,
          height: AppDimensions.height200,
        ),
        SizedBox(height: AppDimensions.height50),
        Text(
          page.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppDimensions.font24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppDimensions.height20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.width20),
          child: Text(
            page.desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppDimensions.font16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
