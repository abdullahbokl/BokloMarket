import 'package:boklo_mart/core/utils/app_strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boklo_mart/bloc_observer.dart';
import 'package:boklo_mart/my_app.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// initialize hive
  await _hiveInit();

  /// sign out
  // await FirebaseAuth.instance.signOut();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BokloMarket(),
  ));
}

/// initialize hive
_hiveInit() async {
  /// initialize hive
  await Hive.initFlutter();

  /// open the box
  await Hive.openBox(AppStrings.kOnBoardingBox);
}
