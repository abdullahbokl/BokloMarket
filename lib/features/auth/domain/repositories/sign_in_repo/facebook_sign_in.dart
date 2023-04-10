import 'package:boklo_mart/features/auth/domain/repositories/sign_in_repo/sign_in_method.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FacebookAuthentication implements SignInMethod {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signIn() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      await _firebaseAuth.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
