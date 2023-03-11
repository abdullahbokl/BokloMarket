import 'package:boklo_mart/features/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:boklo_mart/core/utils/app_constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          AppConstants.showAwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            dialogTitle: 'Registered Successfully',
            message: 'Please check your email to verify your account.',
            titleColor: Colors.green,
            btnOkText: 'Login',
            onOkTap: () {
              Navigator.of(context).pop();
            },
          );
        } else if (state is RegisterFailure) {
          AppConstants.showAwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            dialogTitle: 'Error',
            message: state.message.toString(),
            titleColor: Colors.red,
            btnOkText: 'OK',
            onOkTap: () {},
          );
        }
      },
      child: child,
    );
  }
}
