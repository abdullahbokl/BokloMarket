import 'package:boklo_mart/core/services/firebase/auth_firestore_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  /// static instance
  static ProfileCubit get(context) => BlocProvider.of(context);

  /// instances
  final storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthFirestoreServices _authFirestoreServices = AuthFirestoreServices();

  /// controllers and global keys
  final GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final ImagePicker picker = ImagePicker();

  /// methods

  // update profile image
  Future<void> updateProfileImage() async {
    emit(ProfileImageLoading());
    try {
      // pick image
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      // get user instance
      final user = _auth.currentUser;
      final userModel = await _authFirestoreServices.getUser(user!.uid);
      // check if image is null
      if (image == null) {
        emit(ProfileImageFailed("No image selected"));
        return;
      }
      // convert image path to file and upload it to fire storage
      File file = File(image.path);
      final ref = storage.ref().child(_auth.currentUser!.uid);
      await ref.putFile(file);
      String url = await ref.getDownloadURL();
      // update user model
      userModel.image = url;
      await _authFirestoreServices.updateUser(userModel);
      await user.updatePhotoURL(url);
      emit(ProfileImageSuccess());
    } catch (e) {
      emit(ProfileImageFailed(e.toString()));
    }
  }

// updateName
  Future<void> updateName() async {
    try {
      emit(NameLoading());
      final user = _auth.currentUser;
      final userModel = await _authFirestoreServices.getUser(user!.uid);
      userModel.name = nameController.text;
      await _authFirestoreServices.updateUser(userModel);
      nameController.text = "";
      emit(NameSuccess());
    } catch (e) {
      emit(NameFailed(e.toString()));
    }
  }

  // update Password
  Future<void> updatePassword() async {
    emit(PasswordLoading());
    try {
      final user = _auth.currentUser;
      await user!.updatePassword(passwordController.text);
      passwordController.text = "";
      confirmPasswordController.text = "";
      emit(PasswordSuccess());
    } catch (e) {
      emit(PasswordFailed(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
