import 'package:boklo_mart/features/auth/presentation/cubits/show_hide_password_cubit/show_hide_password_cubit.dart';
import 'package:boklo_mart/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/edit_password.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/edit_name.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class EditUserDataDialog {
  static Future<void> editUserDataDialog({
    required BuildContext context,
    bool name = false,
    bool password = false,
  }) async {
    ProfileCubit profileCubit = ProfileCubit.get(context);
    AuthBloc authBloc = AuthBloc.get(context);
    ShowHidePasswordCubit showHidePasswordCubit =
        ShowHidePasswordCubit.get(context);

    final Widget screen = name ? const EditName() : const EditPassword();

    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider<ProfileCubit>.value(
          value: profileCubit,
          child: SimpleDialog(
            children: <Widget>[
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: authBloc,
                  ),
                  BlocProvider.value(
                    value: profileCubit,
                  ),
                  BlocProvider.value(
                    value: showHidePasswordCubit,
                  ),
                ],
                child: screen,
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const CustomText(
                  text: 'Cancel',
                  color: Colors.red,
                  alignment: Alignment.bottomLeft,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
