import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final VoidCallback onPress;

  const CustomButtonSocial({
    super.key,
    required this.text,
    required this.imageName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade50,
      ),
      child: MaterialButton(
        onPressed: onPress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageName),
            // SizedBox(width: AppDimensions.width20),
            CustomText(
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}
