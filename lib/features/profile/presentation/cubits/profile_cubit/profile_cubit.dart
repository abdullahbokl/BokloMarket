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
      File? file = await _pickImage();
      if (file == null) return;
      // Upload the image to fire storage and get the url
      String url = await _uploadImage(file);
      await _updateUserImage(url);
      emit(ProfileImageSuccess());
    } catch (e) {
      emit(ProfileImageFailed(e.toString()));
    }
  }

  Future<File?> _pickImage() async {
    // pick image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    // check if image is null
    if (image == null) {
      emit(ProfileImageFailed("No image selected"));
      return null;
    }
    // convert image path to file
    File file = File(image.path);
    return file;
  }

  Future<String> _uploadImage(File file) async {
    final ref = storage.ref().child(_auth.currentUser!.uid);
    await ref.putFile(file);
    // get the image url
    String url = await ref.getDownloadURL();
    return url;
  }

  _updateUserImage(String url) async {
    // get user instance
    final user = _auth.currentUser;
    final userModel = await _authFirestoreServices.getUser(user!.uid);
    // update user model
    userModel.image = url;
    await _authFirestoreServices.updateUser(userModel);
    // update user image in firebase auth
    await user.updatePhotoURL(url);
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
