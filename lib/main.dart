import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grad_proj/view/screens/login.dart';
import 'package:grad_proj/view/screens/signup.dart';
import 'package:grad_proj/view/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'ReemKufi',
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: LogIn(),
    );
  }
}

