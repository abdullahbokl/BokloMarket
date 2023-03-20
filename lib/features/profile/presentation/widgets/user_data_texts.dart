import 'package:boklo_mart/features/profile/presentation/widgets/edit_user_data_dialog.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/custom_user_data_field.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class UserDataTexts extends StatelessWidget {
  const UserDataTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = AuthBloc.get(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            /// todo : add inkWill to open bottom sheet to edit every field
            CustomUserDataField(
              text: authBloc.user.name,
              prefixIcon: Icons.person,
              // add edit icon
              suffixIcon: FontAwesomeIcons.solidPenToSquare,
              onTap: () {
                EditUserDataDialog.editUserDataDialog(
                  context: context,
                  name: true,
                );
              },
            ),
            SizedBox(height: AppDimensions.height20),
            CustomUserDataField(
              text: authBloc.user.email,
              prefixIcon: Icons.email,
            ),
            SizedBox(height: AppDimensions.height20),
            CustomUserDataField(
              text: '********',
              prefixIcon: Icons.password,
              suffixIcon: FontAwesomeIcons.solidPenToSquare,
              onTap: () {
                EditUserDataDialog.editUserDataDialog(
                  context: context,
                  password: true,
                );
              },
            ),
            SizedBox(height: AppDimensions.height20),
          ],
        );
      },
    );
  }
}
