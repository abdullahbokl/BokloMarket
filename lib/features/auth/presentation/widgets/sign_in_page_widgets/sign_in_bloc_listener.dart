import 'package:boklo_mart/features/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:boklo_mart/core/utils/app_constants.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:boklo_mart/config/routes/routes.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SignInListener extends StatelessWidget {
  const SignInListener({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.of(context).pushReplacementNamed(Routes.kBottomNavBarRoute);
        } else if (state is SignInFailure) {
          AppConstants.showAwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            dialogTitle: 'Error',
            message: state.message.toString(),
            titleColor: Colors.red,
            btnOkText: 'OK',
            onOkTap: () {
              /*close dialog*/
            },
          );
        } else if (state is VerificationEmailSent) {
          AppConstants.showAwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            dialogTitle: 'Success',
            message: 'Email sent successfully',
            titleColor: Colors.green,
            btnOkText: 'OK',
            onOkTap: () {
              /*close dialog*/
            },
          );
        }
      },
      child: child,
    );
  }
}
