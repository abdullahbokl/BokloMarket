import 'package:boklo_mart/core/utils/data_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  /// static instance
  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  /// controllers
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController resetPasswordController = TextEditingController();

  resetPassword() async {
    emit(ResetPasswordLoading());
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetPasswordController.text);
      emit(ResetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordError(message: e.message!));
    }
    catch (e) {
      emit(ResetPasswordError(message: e.toString()));
    }
  }
}
