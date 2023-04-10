import 'package:boklo_mart/core/services/firebase/auth_firestore_services.dart';
import 'package:boklo_mart/features/auth/domain/repositories/sign_out_repository.dart';
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

    /// resend email verification
    on<ResendEmailVerification>(_resendEmailVerification);
  }

  /// variables
  UserModel user = UserModel(
    name: '',
    email: '',
    image: '',
    id: '',
  );

  /// repositories and instances
  final SignOutRepository authRepository = SignOutRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthFirestoreServices _authFirestoreServices = AuthFirestoreServices();

  /// resend email verification
  Future<void> _resendEmailVerification(
      ResendEmailVerification event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      if (event.email != null) {
        // check if email is not taken
        if (await _checkIfEmailInUse(event.email!)) {
          emit(AuthFailed(message: 'Email is already in use'));
          return;
        } else {
          await _auth.currentUser?.verifyBeforeUpdateEmail(event.email!);
          return;
        }
      } else {
        await _auth.currentUser?.sendEmailVerification();
      }
    } catch (e) {
      emit(AuthFailed(message: e.toString()));
    }
  }

  // check if email is not taken
  // Returns true if email address is in use.
  Future<bool> _checkIfEmailInUse(String emailAddress) async {
    try {
      // Fetch sign-in methods for the email address
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);

      // In case list is not empty
      if (list.isNotEmpty) {
        // Return true because there is an existing user using the email address
        return true;
      } else {
        // Return false because email address is not in use
        return false;
      }
    } catch (error) {
      return true;
    }
  }

  /// fetch user from firebase
  _fetchUser(FetchUserFromFirestore event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      /// get user from firebase
      String userID = _auth.currentUser!.uid;
      user = await _authFirestoreServices.getUser(userID);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailed(message: e.toString()));
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
