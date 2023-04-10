import 'package:boklo_mart/features/auth/domain/repositories/sign_in_repo/sign_in_method.dart';
import 'package:boklo_mart/core/services/firebase/auth_firestore_services.dart';
import 'package:boklo_mart/core/common/models/user_model.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthentication implements SignInMethod {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
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
