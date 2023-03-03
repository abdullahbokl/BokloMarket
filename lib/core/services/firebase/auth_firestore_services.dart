import 'package:boklo_mart/core/common/models/user_model.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// CRUD operations
class AuthFirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// create user
  Future<void> createUser({required UserModel user}) async {
    try {
      await _firestore
          .collection(AppStrings.kUserCollection)
          .doc(user.id.toString())
          .set(user.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// update user
  Future<void> updateUser(UserModel user) async {
    try {
      await _firestore
          .collection(AppStrings.kUserCollection)
          .doc(user.id.toString())
          .update(user.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// delete user
  Future<void> deleteUser(UserModel user) async {
    try {
      await _firestore
          .collection(AppStrings.kUserCollection)
          .doc(user.id.toString())
          .delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// get user
  Future<UserModel> getUser(String id) async {
    try {
      final userDoc = await _firestore.collection('users').doc(id).get();
      return UserModel.fromJson(userDoc.data()!);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// get all users
  Future<List<UserModel>> getUsers() async {
    try {
      final userDocs = await _firestore.collection('users').get();
      return userDocs.docs
          .map((doc) => UserModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// get user by token id
  static Future<String> getUserTokenId() async {
    try {
      final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
      return idToken!;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
