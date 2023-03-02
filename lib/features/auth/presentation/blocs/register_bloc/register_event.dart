part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

/// Register
class RegisterNewUser extends RegisterEvent {}