import 'package:boklo_mart/features/auth/domain/repositories/register_repo/register_method.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailAndPasswordRegistration implements RegisterMethod {
  final String email;
  final String password;

  EmailAndPasswordRegistration({required this.email, required this.password});

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> register() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception('No user found for that email.');
        case 'wrong-password':
          throw Exception('Wrong password provided for that user.');
        case 'weak-password':
          throw Exception('The password provided is too weak.');
        case 'email-already-in-use':
          throw Exception('The account already exists for that email.');
        case 'invalid-email':
          throw Exception('This is not a valid email.');
        default:
          throw Exception('Unknown error.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
