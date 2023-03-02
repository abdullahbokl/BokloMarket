import 'package:boklo_mart/features/auth/domain/repositories/register_repository.dart';
import 'package:boklo_mart/core/services/firebase/firestore_auth_services.dart';
import 'package:boklo_mart/core/common/models/user_model.dart';
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
  FirestoreAuthServices firestoreServices = FirestoreAuthServices();

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
      await registerRepository.registerUsingEmailAndPassword(
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
      );

      /// send email verification
      await _firebaseAuth.currentUser?.sendEmailVerification();

      /// add user to firestore
      UserModel user = UserModel(
        id: _firebaseAuth.currentUser!.uid,
        email: signUpEmailController.text,
        name: signUpNameController.text,
        image: '',
      );
      await firestoreServices.createUser(user: user);

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
