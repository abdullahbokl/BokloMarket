import 'package:boklo_mart/features/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:boklo_mart/core/common/widgets/custom_icon_button_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInBloc signInBloc = BlocProvider.of<SignInBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// google sign in button
        CustomIconButtonWidget(
          icon: Icon(
            FontAwesomeIcons.google,
            color: Colors.red,
            size: AppDimensions.iconSize35,
          ),
          borderColor: Colors.red,
          width: AppDimensions.width55,
          height: AppDimensions.height55,
          onTap: () {
            signInBloc.add(SignInUsingGoogle());
          },
        ),
        SizedBox(width: AppDimensions.width20),

        /// facebook sign in button
        CustomIconButtonWidget(
          icon: Icon(
            FontAwesomeIcons.facebookF,
            color: Colors.blue,
            size: AppDimensions.iconSize35,
          ),
          borderColor: Colors.blue,
          width: AppDimensions.width55,
          height: AppDimensions.height55,
          onTap: () {
            signInBloc.add(SignInUsingFacebook());
          },
        ),
      ],
    );
  }
}
