import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grad_proj/core/constants/fonts.dart';
import 'package:grad_proj/view/screens/landing/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: AppFonts.kPrimaryFont,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}

