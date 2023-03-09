import 'package:boklo_mart/core/services/firebase/auth_firestore_services.dart';
import 'package:boklo_mart/features/auth/domain/repositories/auth_repository.dart';
import 'package:boklo_mart/core/common/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  /// static instance
  static AuthBloc get(context) => BlocProvider.of(context);

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    /// Log Out
    on<SignOut>(_signOut);

    /// fetch user from firebase
    on<FetchUserFromFirestore>(_fetchUser);
  }

  /// variables
  UserModel user = UserModel(
    name: '',
    email: '',
    image: '',
    id: '',
  );

  /// repositories and instances
  final AuthRepository authRepository = AuthRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthFirestoreServices _authFirestoreServices = AuthFirestoreServices();

  /// fetch user from firebase
  _fetchUser(FetchUserFromFirestore event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      /// get user from firebase
      String userID = _auth.currentUser!.uid;
      user = await _authFirestoreServices.getUser(userID);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  /// Sign out
  Future<void> _signOut(SignOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.signOut();
      emit(SignOutSuccess());
    } catch (e) {
      emit(SignOutFailure(message: e.toString()));
    }
  }
}
