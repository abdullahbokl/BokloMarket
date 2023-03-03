import 'package:boklo_mart/features/auth/presentation/widgets/register_page_widgets/register_bloc_listener.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/register_page_widgets/custom_back_button.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/register_page_widgets/register_form.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/loading_indicator.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/welcome_message.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RegisterBlocListener(
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: LimitedBox(
                  maxHeight: AppDimensions.height,
                  maxWidth: AppDimensions.width,
                  child: Padding(
                    padding: _padding(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        /// back button
                        CustomBackButton(),
                        Spacer(flex: 1),

                        /// welcome message
                        WelcomeMessage(
                            welcomeMessage: 'Register to Continue'),
                        Spacer(flex: 1),

                        /// sign up form
                        RegisterForm(),
                        Spacer(flex: 2),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        /// loading indicator
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return (state is RegisterLoading)
                ? const LoadingIndicator()
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  EdgeInsets _padding() {
    return EdgeInsets.only(
      left: AppDimensions.width20,
      right: AppDimensions.width20,
      top: AppDimensions.height40,
    );
  }
}
