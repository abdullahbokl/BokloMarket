import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/features/profile/presentation/views/edit_user_data.dart';
import 'package:boklo_mart/core/common/widgets/custom_button_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = AuthBloc.get(context);
    return CustomButton(
      width: AppDimensions.width100,
      height: AppDimensions.height30,
      suffixIcon: FontAwesomeIcons.solidPenToSquare,
      suffixIconColor: AppColors.primaryColor2,
      gradient: AppColors.secondaryGradient(),
      text: 'Edit profile',
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: authBloc,
              child: const EditUserDataScreen(),
            ),
          ),
        );
      },
    );
  }
}
