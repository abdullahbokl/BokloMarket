import 'package:boklo_mart/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.isPasswordHidden,
    required this.onSuffixIconTap,
    required this.controller,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final bool isPasswordHidden;
  final VoidCallback onSuffixIconTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isPasswordHidden,
      prefixIcon: Icons.lock_outline,
      suffixIcon: isPasswordHidden ? Icons.visibility : Icons.visibility_off,
      onSuffixIconTap: onSuffixIconTap,
      controller: controller,
      hint: 'Password',
      onSave: (value) {},
      validator: validator,
    );
  }
}
