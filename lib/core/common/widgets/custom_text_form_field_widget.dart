import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final VoidCallback? onSuffixIconTap;
  final int? maxLines;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    this.hint = '',
    this.onSave,
    this.validator,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onSuffixIconTap,
    this.maxLines,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height65,
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.width10),
      decoration: BoxDecoration(
        // upper border
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: AppDimensions.height2,
          ),
          // bottom border
          bottom: BorderSide(
            color: Colors.grey,
            width: AppDimensions.height2,
          ),
        ),
      ),
      child: Row(
        children: [
          if (prefixIcon != null)
            Icon(
              prefixIcon,
              color: Colors.grey,
            ),
          SizedBox(width: AppDimensions.width10),
          Expanded(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              obscureText: obscureText ?? false,
              onSaved: onSave,
              validator: validator,
              maxLines: maxLines ?? 1,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Colors.white,
              ),
            ),
          ),
          if (suffixIcon != null)
            GestureDetector(
              onTap: onSuffixIconTap,
              child: Icon(
                suffixIcon,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
