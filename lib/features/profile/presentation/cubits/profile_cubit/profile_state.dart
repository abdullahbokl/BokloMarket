part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {}

class ProfileFailed extends ProfileState {
  final String error;

  ProfileFailed(this.error);
}

/// name

class NameLoading extends ProfileState {}

class NameSuccess extends ProfileState {}

class NameFailed extends ProfileState {
  final String error;

  NameFailed(this.error);
}

/// password

class PasswordLoading extends ProfileState {}

class PasswordSuccess extends ProfileState {}

class PasswordFailed extends ProfileState {
  final String error;

  PasswordFailed(this.error);
}

/// profile image

class ProfileImageLoading extends ProfileState {}

class ProfileImageSuccess extends ProfileState {}

class ProfileImageFailed extends ProfileState {
  final String error;

  ProfileImageFailed(this.error);
}
