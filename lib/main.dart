import 'package:boklo_mart/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:boklo_mart/helper/binding/binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const BokloMart());
}

class BokloMart extends StatelessWidget {
  const BokloMart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      title: 'Store App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueGrey,
        brightness: Brightness.light,
      ),
      getPages: routes,
      initialRoute: kControlRoute,
    );
  }
}
