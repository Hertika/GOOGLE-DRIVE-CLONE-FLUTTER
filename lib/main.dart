import 'package:driveclone/screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart'; // Add this import
import 'package:driveclone/screens/signin_screen.dart';
import 'package:driveclone/controllers/authentication_controller.dart';
import 'package:driveclone/widgets/recent_files.dart';

import 'package:driveclone/widgets/storage_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Root(),
    );
  }
}

class Root extends StatelessWidget {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return authController.user.value == null ? SigninScreen() : NavScreen();
      },
    );
  }
}
