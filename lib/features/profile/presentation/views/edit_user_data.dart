import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/edit_user_data_screen_widgets/edit_user_data_text_form_fields.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/edit_user_data_screen_widgets/edit_user_image.dart';
import 'package:boklo_mart/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/edit_user_data_screen_widgets/save_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class EditUserDataScreen extends StatelessWidget {
  const EditUserDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = AuthBloc.get(context);
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit user data'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.width20,
            vertical: AppDimensions.height20,
          ),
          child: Column(
            children: [
              const EditUserImage(),
              SizedBox(height: AppDimensions.height20),
              const EditUserDataTextFormFields(),
              SizedBox(height: AppDimensions.height20),
              SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
