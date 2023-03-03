import 'package:boklo_mart/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:boklo_mart/core/utils/app_constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          AppConstants.showAwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            dialogTitle: 'Success',
            message: 'Password reset link has been sent to your email address',
            titleColor: Colors.green,
            onOkTap: () {
              GoRouter.of(context).pop();
            },
          );
        } else if (state is ResetPasswordError) {
          AppConstants.showAwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            dialogTitle: 'Error',
            message: state.message,
            titleColor: Colors.red,
            onOkTap: () {
              GoRouter.of(context).pop();
            },
          );
        }

      },
      child: child,
    );
  }
}
