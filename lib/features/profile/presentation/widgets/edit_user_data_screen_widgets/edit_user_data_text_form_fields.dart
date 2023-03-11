import 'package:boklo_mart/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class EditUserDataTextFormFields extends StatelessWidget {
  const EditUserDataTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = AuthBloc.get(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ProfileCubit profileCubit = ProfileCubit.get(context)..showUserData();
        return Column(
          children: [
            CustomTextFormField(
              controller: profileCubit.nameController,
              prefixIcon: Icons.person,
              suffixIcon: FontAwesomeIcons.solidPenToSquare,
            ),
            SizedBox(height: AppDimensions.height20),

            CustomTextFormField(
              controller: profileCubit.emailController,
              prefixIcon: Icons.email,
              suffixIcon: FontAwesomeIcons.solidPenToSquare,
            ),
            SizedBox(height: AppDimensions.height20),

            CustomTextFormField(
              controller: profileCubit.passwordController,
              prefixIcon: Icons.password,
              suffixIcon: FontAwesomeIcons.solidPenToSquare,
            ),
          ],
        );
      },
    );
  }
}
