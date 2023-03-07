import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DetailsTextField extends StatelessWidget {
  const DetailsTextField({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.width15,
      ),
      height: AppDimensions.height50,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyHintColor,
          width: AppDimensions.width2,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radius10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: text,
            fontSize: AppDimensions.font20,
            fontWeight: FontWeight.bold,
          ),
          GestureDetector(
              onTap: onTap, child: const FaIcon(FontAwesomeIcons.edit)),
        ],
      ),
    );
  }
}
