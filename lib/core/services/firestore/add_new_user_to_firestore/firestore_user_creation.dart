import 'package:boklo_mart/core/services/firestore/add_new_user_to_firestore/user_creation_method.dart';
import 'package:boklo_mart/core/services/firebase/auth_firestore_services.dart';
import 'package:boklo_mart/core/common/models/user_model.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// after creating a user, make sure that the user is not exists bedfore, before adding it to firestore
class FirestoreUserCreation implements UserCreationMethod {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> createUserIfNotExist(UserModel user) async {
    final userSnapshot = await _firebaseFirestore
        .collection(AppStrings.kUserCollection)
        .doc(user.id)
        .get();
    if (!userSnapshot.exists) {
      await AuthFirestoreServices().createUser(user: user);
    }
  }
}
