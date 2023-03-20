import 'package:boklo_mart/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/features/profile/presentation/widgets/save_button.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boklo_mart/core/utils/data_validation.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class EditName extends StatelessWidget {
  const EditName({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = ProfileCubit.get(context);
    AuthBloc authBloc = AuthBloc.get(context);
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) async {
        if (state is NameSuccess) {
          Navigator.pop(context);
          authBloc.add(FetchUserFromFirestore());
        } else if (state is NameFailed) {
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
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppDimensions.width20,
          vertical: AppDimensions.height20,
        ),
        child: Form(
          key: profileCubit.nameFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'Edit your name',
                fontSize: AppDimensions.font20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: AppDimensions.height20),
              CustomTextFormField(
                validator: (value) {
                  return DataValidation.validateName(value ?? '');
                },
                controller: profileCubit.nameController,
                prefixIcon: Icons.person,
                suffixIcon: FontAwesomeIcons.solidPenToSquare,
              ),
              SizedBox(height: AppDimensions.height20),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return SaveButton(
                    onTap: () {
                      if (profileCubit.nameFormKey.currentState!.validate()) {
                        profileCubit.updateName();
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
