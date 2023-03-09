import 'package:boklo_mart/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/loading_indicator.dart';
import 'package:boklo_mart/features/profile/presentation/views/user_data_screen.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:boklo_mart/core/utils/app_constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: _padding(),
          child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  AppConstants.showAwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    dialogTitle: 'Error',
                    message: state.message,
                    titleColor: Colors.red,
                  );
                }
              },
              builder: (context, state) {
                /// todo : Shimmer effect
                return const UserDataScreen();
              },
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets _padding() {
    return EdgeInsets.only(
      top: AppDimensions.height15,
      left: AppDimensions.width30,
      right: AppDimensions.width30,
      bottom: AppDimensions.height5,
    );
  }
}
