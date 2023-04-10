import 'package:boklo_mart/features/auth/domain/repositories/sign_in_repo/sign_in_method.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailAndPasswordSignIn implements SignInMethod {
  final String email;
  final String password;

  EmailAndPasswordSignIn({required this.email, required this.password});

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signIn() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }
}
