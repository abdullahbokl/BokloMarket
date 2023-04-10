import 'package:boklo_mart/features/auth/domain/repositories/sign_in_repo/sign_in_method.dart';
import 'package:boklo_mart/core/services/firebase/auth_firestore_services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:boklo_mart/core/common/models/user_model.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FacebookAuthentication implements SignInMethod {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> signIn() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      await _firebaseAuth.signInWithCredential(facebookAuthCredential);
      await _addNewUserToFirestore();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> _addNewUserToFirestore() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      final userSnapshot = await _firebaseFirestore
          .collection(AppStrings.kUserCollection)
          .doc(currentUser.uid)
          .get();
      if (!userSnapshot.exists) {
        UserModel user = UserModel(
          id: currentUser.uid,
          email: currentUser.email ?? '',
          name: currentUser.displayName ?? '',
          image: currentUser.photoURL ?? '',
        );
        await AuthFirestoreServices().createUser(user: user);
      }
    }
  }
}
