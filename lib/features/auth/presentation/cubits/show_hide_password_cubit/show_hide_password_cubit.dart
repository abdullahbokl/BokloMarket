import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'show_hide_password_state.dart';

class ShowHidePasswordCubit extends Cubit<ShowHidePasswordState> {
  /// static instance
  static ShowHidePasswordCubit get(context) => BlocProvider.of(context);

  ShowHidePasswordCubit() : super(ShowHidePasswordInitial());

  /// variables
  bool isRegisterPasswordHidden = true;
  bool isRegisterConfirmPasswordHidden = true;
  bool isSignInPasswordHidden = true;

  /// methods
  showHidePassword({required String type}) {
    switch (type) {
      case AppStrings.kRegisterPasswordController:
        isRegisterPasswordHidden = !isRegisterPasswordHidden;
        break;
      case AppStrings.kRegisterConfirmPasswordController:
        isRegisterConfirmPasswordHidden = !isRegisterConfirmPasswordHidden;
        break;
      case AppStrings.kSignInPasswordController:
        isSignInPasswordHidden = !isSignInPasswordHidden;
        break;
      default:
        break;
    }
    emit(PasswordStateChanged());
  }
}
