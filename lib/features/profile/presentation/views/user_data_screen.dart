import 'package:boklo_mart/features/profile/presentation/widgets/user_data_screen_widgets/edit_profile_button.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/user_data_screen_widgets/sign_out_button.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/user_data_screen_widgets/user_data_texts.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/core/common/widgets/avatar_image.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatelessWidget {
  const UserDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Column(
      children: [
        SizedBox(height: AppDimensions.height30),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return AvatarImage(imageUrl: authBloc.user.image ?? '');
          },
        ),
        SizedBox(height: AppDimensions.height10),
        const EditProfileButton(),
        SizedBox(height: AppDimensions.height50),
        const UserDataTexts(),
        SizedBox(height: AppDimensions.height50),
        const SignOutButton(),
      ],
    );
  }
}
