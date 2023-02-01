import 'package:boklo_mart/core/services/add_user_data_to_firestore_service.dart';
import 'package:boklo_mart/model/user_model.dart';
import 'package:boklo_mart/view/auth/login_page.dart';
import 'package:boklo_mart/view/home_page.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookLogin = FacebookAuth.instance;
  RxBool isSignedIn = false.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    signOut();
    isSignedIn.value = false;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) isSignedIn.value = true;
    });
  }

  //   Create User With Email And Password
  createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    isLoading.value = true;
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((user) async {
        // Add User Data To Firestore
        return await addUserDataToFirestore(user: user, name: name);
      });
      // move to the Home Page
      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      _onFirebaseAuthException(e);
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  // expected errors
  _onFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        Get.snackbar('Error', 'The password provided is too weak.');
        break;
      case 'email-already-in-use':
        Get.snackbar('Error', 'The account already exists for that email.');
        break;
      case 'invalid-email':
        Get.snackbar('Error', 'This is not a valid email.');
        break;
      default:
        Get.snackbar('Error', 'Unknown error.');
    }
  }

  //   Sign In With Email And Password
  signInWithEmailAndPassword(
      {required String email, required String password}) async {
    isLoading.value = true;

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

  //   Sign In With Google
  void googleSignInMethod() async {
    isLoading.value = true;

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
      await _firebaseAuth.signInWithCredential(credential).then((user) {
        return addUserDataToFirestore(user: user);
      });
      Get.offAll(HomePage());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    isLoading.value = false;
  }

  //   Sign In With Facebook
  signInWithFacebook() async {
    isLoading.value = true;

    final LoginResult loginResult = await _facebookLogin.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((user) {
      addUserDataToFirestore(user: user);
      isLoading.value = false;
      Get.offAll(HomePage());
    });
  }

  //   Sign Out
  void signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    await _facebookLogin.logOut();
    Get.offAll(LoginPage());
  }

  addUserDataToFirestore({required UserCredential user, String? name}) async {
    await AddUserDataToFirestore.addUserDataToFirestore(
        user: UserModel(
      uid: user.user!.uid,
      email: user.user!.email!,
      name: name ?? user.user!.displayName!,
      image: user.user!.photoURL!,
    ));
  }
}
