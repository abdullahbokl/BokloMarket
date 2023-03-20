part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

/// log out
class SignOut extends AuthEvent {}

/// add user to firestore
class AddUserToFirestore extends AuthEvent {
  final UserModel user;

  AddUserToFirestore({required this.user});
}

/// fetch user from firestore
class FetchUserFromFirestore extends AuthEvent {}

/// resend email verification
class ResendEmailVerification extends AuthEvent {
  final String? email;

  ResendEmailVerification({this.email});
}