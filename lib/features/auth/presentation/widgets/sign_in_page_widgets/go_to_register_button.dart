import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/config/routes/routes.dart';
import 'package:flutter/material.dart';

class GoToRegisterButton extends StatelessWidget {
  const GoToRegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomText(text: 'Don\'t have an account?'),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.kRegisterRoute);
          },
          child: const CustomText(
            text: 'Register',
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
