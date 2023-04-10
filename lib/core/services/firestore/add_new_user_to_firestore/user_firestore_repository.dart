import 'package:boklo_mart/core/services/firestore/add_new_user_to_firestore/firestore_user_creation.dart';
import 'package:boklo_mart/core/common/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


/// create a user from user model
class UserFirestoreRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreUserCreation _firestoreUserCreation = FirestoreUserCreation();

  UserFirestoreRepository();

  Future<void> addNewUserToFirestore() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      UserModel user = UserModel(
        id: currentUser.uid,
        email: currentUser.email ?? '',
        name: currentUser.displayName ?? '',
        image: currentUser.photoURL ?? '',
      );
      await _firestoreUserCreation.createUserIfNotExist(user);
    }
  }
}
