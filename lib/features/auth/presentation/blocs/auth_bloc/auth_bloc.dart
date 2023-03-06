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
    on<SignOut>(_signOut);
  }

  /// repositories
  final AuthRepository authRepository = AuthRepository();

  /// Sign out
  Future<void> _signOut(SignOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.signOut();
      emit(SignOutSuccess());
    } catch (e) {
      emit(SignOutFailure(message: e.toString()));
    }
  }
}
