import 'package:boklo_mart/features/auth/presentation/widgets/reset_password_page_widgets/reset_password_bloc_listener.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/reset_password_page_widgets/reset_password_form.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/register_page_widgets/custom_back_button.dart';
import 'package:boklo_mart/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/loading_indicator.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResetPasswordBlocListener(
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              body: SingleChildScrollView(
                child: LimitedBox(
                  maxHeight: AppDimensions.height,
                  maxWidth: AppDimensions.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.width20,
                        vertical: AppDimensions.height30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomBackButton(),
                        Spacer(flex: 1),
                        ResetPasswordForm(),
                        Spacer(flex: 2),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              builder: (context, state) {
                return (state is ResetPasswordLoading)
                    ? const LoadingIndicator()
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
