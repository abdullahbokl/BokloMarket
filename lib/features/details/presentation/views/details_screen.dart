import 'package:boklo_mart/features/details/presentation/widgets/custom_back_button.dart';
import 'package:boklo_mart/features/details/presentation/widgets/bottom_curved_part.dart';
import 'package:boklo_mart/features/details/presentation/widgets/upper_part.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: AppColors.secondaryGradient(),
        ),
        child: Stack(
          children: const [
            // back button
            CustomBackButton(),
            // upper part
            Align(
              alignment: Alignment.topCenter,
              child: UpperPart(),
            ),
            // bottom curved part
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomCurvedPart(),
            ),
          ],
        ),
      ),
    );
  }
}
