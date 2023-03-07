import 'package:boklo_mart/core/common/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  /// static instance
  static ProfileCubit get(context) => BlocProvider.of(context);
  late UserModel user;

  /// methods
  fetchUser() async {
    emit(ProfileLoading());
    try {
      /// get user from firebase
      // user = firestoreUser
      user = UserModel(
        id: '1',
        name: 'John Doe',
        email: 'dasdasd',
      );

      emit(ProfileSuccess());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
