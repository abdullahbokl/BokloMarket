part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

/// log out
class Logout extends AuthEvent {}

/// add user to firestore
class AddUserToFirestore extends AuthEvent {
  final UserModel user;

  AddUserToFirestore({required this.user});
}