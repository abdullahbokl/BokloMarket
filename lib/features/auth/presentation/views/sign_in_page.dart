import 'package:boklo_mart/features/auth/presentation/widgets/sign_in_page_widgets/go_to_register_button.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/sign_in_page_widgets/sign_in_bloc_listener.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/sign_in_page_widgets/sign_in_form.dart';
import 'package:boklo_mart/features/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/loading_indicator.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/welcome_message.dart';
import 'package:boklo_mart/features/auth/presentation/widgets/social_sign_in.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: SignInListener(
            child: Scaffold(
              body: SingleChildScrollView(
                child: LimitedBox(
                  maxHeight: AppDimensions.height,
                  maxWidth: AppDimensions.width,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppDimensions.width20),
                    child: Column(
                      children: const [
                        Spacer(flex: 3),

                        /// welcome message
                        WelcomeMessage(welcomeMessage: 'Sign In to Continue'),
                        Spacer(flex: 1),

                        /// sign in form
                        SignInForm(),

                        /// go to sign up page button
                        GoToRegisterButton(),
                        Spacer(flex: 2),

                        /// social login
                        SocialSignIn(),

                        Spacer(flex: 3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return (state is SignInLoading)
                ? const LoadingIndicator()
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }

}
