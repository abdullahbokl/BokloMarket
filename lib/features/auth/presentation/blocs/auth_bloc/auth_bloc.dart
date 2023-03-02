import 'package:boklo_mart/features/auth/domain/repositories/auth_repository.dart';
import 'package:boklo_mart/core/common/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  /// static instance
  static AuthBloc get(context) => BlocProvider.of(context);

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    /// Log Out
    on<Logout>(_logout);
  }

  /// repositories
  final AuthRepository authRepository = AuthRepository();

  /// variables
  bool isRegisterPasswordHidden = true;
  bool isRegisterConfirmPasswordHidden = true;
  bool isSignInPasswordHidden = true;

  /// logout
  Future<void> _logout(Logout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      authRepository.signOut();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
      throw Exception(e);
    }
  }

  /// todo : forget password
// Future<void> forgetPassword(String email) async {
//   await firebaseAuth.sendPasswordResetEmail(email: email);
// }
}
