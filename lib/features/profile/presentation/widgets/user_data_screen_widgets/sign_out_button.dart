import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:boklo_mart/config/routes/routes.dart';
import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = AuthBloc.get(context);
    return CustomButton(
      text: 'Sign Out',
      onTap: () {
        authBloc.add(SignOut());
        Navigator.of(context).pushReplacementNamed(Routes.kSignInRoute);
      },
    );
  }
}
