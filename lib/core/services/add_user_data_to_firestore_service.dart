import 'package:boklo_mart/constants.dart';
import 'package:boklo_mart/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUserDataToFirestore {

  static addUserDataToFirestore({required UserModel user}) async {
    await FirebaseFirestore.instance.collection(kUserCollection).doc(user.uid).set(user.toJson());
  }


}