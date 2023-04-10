import 'package:boklo_mart/features/auth/domain/repositories/sign_in_repo/sign_in_method.dart';

class SignInRepository {
  Future<void> signInWith(SignInMethod method) async {
    await method.signIn();
  }
}
