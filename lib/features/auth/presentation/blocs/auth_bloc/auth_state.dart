part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

/// general auth States
class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailed extends AuthState {
  final String message;

  AuthFailed({required this.message});
}

/// sign out
class SignOutSuccess extends AuthState {}

class SignOutFailure extends AuthState {
  final String message;

  SignOutFailure({required this.message});
}


/// resend email verification
class VerificationEmailSent extends AuthState {}