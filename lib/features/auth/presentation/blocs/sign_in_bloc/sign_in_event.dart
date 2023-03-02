part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

/// Sign In With Email And Password
class SignInUsingEmailAndPassword extends SignInEvent {}

/// Sign In With Google
class SignInUsingFacebook extends SignInEvent {}

///  Sign In With Facebook
class SignInUsingGoogle extends SignInEvent {}

/// resend email verification
class ResendEmailVerification extends SignInEvent {}
