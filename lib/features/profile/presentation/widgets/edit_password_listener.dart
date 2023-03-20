import 'package:boklo_mart/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/core/utils/app_constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class EditPasswordListener extends StatelessWidget {
  const EditPasswordListener({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is PasswordSuccess) {
          AppConstants.showAwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            dialogTitle: 'Success',
            message: 'Your password has been updated successfully.',
            titleColor: Colors.green,
            onOkTap: () {
              Navigator.pop(context);
            },
          );
        } else if (state is PasswordFailed) {
          AppConstants.showAwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            dialogTitle: 'Error',
            message: 'Something went wrong. Please try again later.',
            titleColor: Colors.red,
            onOkTap: () {
              Navigator.pop(context);
            },
          );
        }
      },
      child: child,
    );
  }
}
