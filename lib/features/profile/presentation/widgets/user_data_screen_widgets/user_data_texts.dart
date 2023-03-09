import 'package:boklo_mart/features/profile/presentation/widgets/user_data_screen_widgets/custom_user_data_field.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
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
            CustomUserDataField(
              text: authBloc.user.name,
              suffixIcon: Icons.person,
            ),
            SizedBox(height: AppDimensions.height20),
            CustomUserDataField(
              text: authBloc.user.email,
              suffixIcon: Icons.person,
            ),
            SizedBox(height: AppDimensions.height20),
            const CustomUserDataField(
              text: '********',
              suffixIcon: Icons.person,
            ),
            SizedBox(height: AppDimensions.height20),
          ],
        );
      },
    );
  }
}
