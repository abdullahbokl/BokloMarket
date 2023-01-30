import 'package:boklo_mart/view/home_page.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookLogin = FacebookAuth.instance;

  void googleSignInMethod() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception("Google sign-in failed");
      }
      final googleSignInAuthentication = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await _firebaseAuth.signInWithCredential(credential).then((value) {
        Get.offAll(HomePage());
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  signInWithFacebook() async {
    final LoginResult loginResult = await _facebookLogin.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((value) {
      Get.offAll(HomePage());
    });
  }

  signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.offAll(HomePage());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
            'No user found for that email.', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Wrong password provided for that user.',
            'Wrong password provided for that user.');
      }
    }
  }

  void signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    await _facebookLogin.logOut();
  }
}
