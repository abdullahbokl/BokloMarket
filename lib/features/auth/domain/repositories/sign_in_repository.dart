import 'package:boklo_mart/core/services/firebase/auth_firestore_services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:boklo_mart/core/common/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// sign in with email and password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
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

  /// sign in with google
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      /// add user to firestore if it's a new user

      if (userCredential.additionalUserInfo!.isNewUser) {
        UserModel user = UserModel(
          id: _firebaseAuth.currentUser?.uid ?? '',
          email: _firebaseAuth.currentUser?.email ?? '',
          name: _firebaseAuth.currentUser?.displayName ?? '',
          image: _firebaseAuth.currentUser?.photoURL ?? '',
        );
        await AuthFirestoreServices().createUser(user: user);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// sign in with facebook
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      ///  add user to firestore if it's a new user

      if (userCredential.additionalUserInfo!.isNewUser) {
        UserModel user = UserModel(
          id: _firebaseAuth.currentUser?.uid ?? '',
          email: _firebaseAuth.currentUser?.email ?? '',
          name: _firebaseAuth.currentUser?.displayName ?? '',
          image: _firebaseAuth.currentUser?.photoURL ?? '',
        );
        await AuthFirestoreServices().createUser(user: user);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
