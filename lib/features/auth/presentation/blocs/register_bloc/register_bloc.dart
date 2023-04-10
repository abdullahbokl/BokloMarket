import 'package:boklo_mart/core/services/firestore/add_new_user_to_firestore/user_firestore_repository.dart';
import 'package:boklo_mart/features/auth/domain/repositories/register_repo/email_and_password_register.dart';
import 'package:boklo_mart/features/auth/domain/repositories/register_repo/register_repository.dart';
import 'package:boklo_mart/core/services/firebase/auth_firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  /// static instance
  static RegisterBloc get(context) => BlocProvider.of(context);

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});

    /// Register A New User
    on<RegisterNewUser>(_register);
  }

  /// services
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthFirestoreServices firestoreServices = AuthFirestoreServices();

  /// repositories
  final RegisterRepository registerRepository = RegisterRepository();

  /// controllers
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController signUpConfirmPasswordController =
      TextEditingController();
  final TextEditingController signUpNameController = TextEditingController();

  /// methods

  /// Register using email and password
  Future<void> _register(
      RegisterNewUser event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    try {
      EmailAndPasswordRegistration emailAndPasswordRegistration =
          EmailAndPasswordRegistration(
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
      );

      await registerRepository.registerWith(emailAndPasswordRegistration);

      /// send email verification
      await _firebaseAuth.currentUser?.sendEmailVerification();

      /// add user to firestore
      await UserFirestoreRepository().addNewUserToFirestore();

      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(message: e.message!));
    } catch (e) {
      emit(RegisterFailure(message: e.toString()));
    }
  }

  /// dispose controllers
  @override
  Future<void> close() {
    /// dispose register controllers
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpNameController.dispose();
    signUpConfirmPasswordController.dispose();

    return super.close();
  }
}
