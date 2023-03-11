import 'package:boklo_mart/core/services/firebase/auth_firestore_services.dart';
import 'package:boklo_mart/core/common/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  /// static instance
  static ProfileCubit get(context) => BlocProvider.of(context);

  /// controllers and global keys
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// variables

  bool isNameEnabled = true;
  bool isEmailEnabled = true;
  bool isPasswordEnabled = true;

  // instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthFirestoreServices _authFirestoreServices = AuthFirestoreServices();

  void showUserData() {
    nameController.text = _auth.currentUser!.displayName!;
    emailController.text = _auth.currentUser!.email!;
    passwordController.text = '********';
  }

  // save user data to firebase
  void saveUserData() {
    _auth.currentUser!.updateDisplayName(nameController.text);
    _auth.currentUser!.updateEmail(emailController.text);
    _auth.currentUser!.updatePassword(passwordController.text);
    _auth.currentUser!.reload();
    _authFirestoreServices.updateUser(
      UserModel(
        id: _auth.currentUser!.uid,
        /// todo : edit image
        image: '',
        name: nameController.text,
        email: emailController.text,
      ),
    );
  }
}
