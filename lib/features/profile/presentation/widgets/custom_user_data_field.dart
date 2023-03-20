import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomUserDataField extends StatelessWidget {
  const CustomUserDataField({
    Key? key,
    required this.prefixIcon,
    required this.text,
    this.onTap,
    this.suffixIcon,
  }) : super(key: key);

  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppDimensions.height55,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.width10),
        decoration: BoxDecoration(
          // upper border
          border: Border.all(
            color: Colors.grey,
            width: AppDimensions.height2,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.radius10),
        ),
        child: Row(
          children: [
            Icon(
              prefixIcon,
              color: Colors.grey,
            ),
            SizedBox(width: AppDimensions.width10),
            CustomText(
              text: text,
              fontSize: AppDimensions.font16,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            if (suffixIcon != null)
              Icon(
                suffixIcon,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}
