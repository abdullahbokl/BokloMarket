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

  UserModel user = UserModel(
    name: '',
    email: '',
    image: '',
    id: '',
  );

  bool isNameEnabled = true;
  bool isEmailEnabled = true;
  bool isPasswordEnabled = true;

  // instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthFirestoreServices _authFirestoreServices = AuthFirestoreServices();

  /// methods
  fetchUser() async {
    emit(ProfileLoading());
    try {
      /// get user from firebase
      String userID = _auth.currentUser!.uid;
      user = await _authFirestoreServices.getUser(userID);
      nameController.text = user.name;
      emailController.text = user.email;
      passwordController.text = '********';
      emit(ProfileSuccess());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

}
