import 'package:boklo_mart/core/services/firestore/add_new_user_to_firestore/user_firestore_repository.dart';
import 'package:boklo_mart/features/auth/domain/repositories/sign_in_repo/email_and_password_sign_in.dart';
import 'package:boklo_mart/features/auth/domain/repositories/sign_in_repo/sign_in_repository.dart';
import 'package:boklo_mart/features/auth/domain/repositories/sign_in_repo/facebook_sign_in.dart';
import 'package:boklo_mart/features/auth/domain/repositories/sign_in_repo/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  /// static instance
  static SignInBloc get(context) => BlocProvider.of(context);

  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});

    /// Sign In With Email And Password
    on<SignInUsingEmailAndPassword>(_signInWithEmailAndPassword);

    /// Sign In With Google
    on<SignInUsingGoogle>(_signInWithGoogle);

    ///   Sign In With Facebook
    on<SignInUsingFacebook>(_signInWithFacebook);
  }

  /// repositories
  final SignInRepository signInRepository = SignInRepository();

  /// services
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth facebookLogin = FacebookAuth.instance;

  /// sign in controllers
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController signInEmailController = TextEditingController();
  final TextEditingController signInPasswordController =
      TextEditingController();

  /// Sign In With Email And Password
  Future<void> _signInWithEmailAndPassword(
      SignInUsingEmailAndPassword event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    try {
      EmailAndPasswordSignIn emailAndPasswordAuth = EmailAndPasswordSignIn(
        email: signInEmailController.text,
        password: signInPasswordController.text,
      );

      await signInRepository.signInWith(emailAndPasswordAuth);

      if (firebaseAuth.currentUser?.emailVerified ?? false) {
        emit(SignInSuccess());
      } else {
        // emit custom message
        firebaseAuth.signOut();
        emit(SignInFailure(message: AppStrings.verifyEmail));
      }
    } on FirebaseAuthException catch (e) {
      emit(SignInFailure(message: e.message!));
    } catch (e) {
      emit(SignInFailure(message: e.toString()));
    }
  }

  /// sign in using google
  Future<void> _signInWithGoogle(
      SignInUsingGoogle event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    try {
      GoogleAuthentication googleAuth = GoogleAuthentication();

      await signInRepository.signInWith(googleAuth);

      /// add user to firestore
      await UserFirestoreRepository().addNewUserToFirestore();

      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFailure(message: e.toString()));
    }
  }

  /// sign in using facebook
  Future<void> _signInWithFacebook(
      SignInUsingFacebook event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    try {
      FacebookAuthentication facebookAuth = FacebookAuthentication();
      await signInRepository.signInWith(facebookAuth);

      /// add user to firestore

      await UserFirestoreRepository().addNewUserToFirestore();

      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFailure(message: e.toString()));
    }
  }

  /// dispose sign in controllers
  @override
  Future<void> close() {
    /// dispose sign in controllers
    signInEmailController.dispose();
    signInPasswordController.dispose();

    return super.close();
  }
}
