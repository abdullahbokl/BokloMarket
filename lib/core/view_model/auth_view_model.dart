import 'package:boklo_mart/core/services/add_user_data_to_firestore_service.dart';
import 'package:boklo_mart/model/user_model.dart';
import 'package:boklo_mart/view/auth/login_page.dart';
import 'package:boklo_mart/view/control_view.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookLogin = FacebookAuth.instance;
  var uid = ''.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    uid.value = _firebaseAuth.currentUser?.uid ?? '';
  }

  //   Create User With Email And Password
  createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    isLoading.value = true;
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await addUserDataToFirestore(user: credential, name: name);
      Get.offAll(ControlView());
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
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(ControlView());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
            'No user found for that email.', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Wrong password provided for that user.',
            'Wrong password provided for that user.');
      }
    }
    isLoading.value = false;
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
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      UserCredential credential =
          await _firebaseAuth.signInWithCredential(authCredential);
      await addUserDataToFirestore(user: credential);
      Get.offAll(ControlView());
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
    UserCredential Credential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    await addUserDataToFirestore(user: Credential);
    isLoading.value = false;
    Get.offAll(ControlView());
  }

  //   Sign Out
  void signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    await _facebookLogin.logOut();
    Get.offAll(LoginPage());
  }

  addUserDataToFirestore({required UserCredential user, String? name}) async {
    uid.value = user.user!.uid;
    await AddUserDataToFirestore.addUserDataToFirestore(
        user: UserModel(
      uid: user.user!.uid,
      email: user.user!.email!,
      name: name ?? user.user!.displayName!,
      image: user.user!.photoURL,
    ));
  }
}
