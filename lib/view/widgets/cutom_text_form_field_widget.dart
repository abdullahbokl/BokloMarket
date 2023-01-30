import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomTextFormField({

    super.key,
    this.text = '',
    this.hint = '',
    this.onSave,
    this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            controller: controller,
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              fillColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
