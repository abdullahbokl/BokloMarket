import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// sign up with email and password
  Future<void> registerUsingEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
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
