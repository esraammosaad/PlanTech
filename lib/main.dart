import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/services/preferanceManager.dart';
import 'package:grad_proj/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bindings.dart';
import 'core/class/them_controller.dart';
import 'core/localization/change_local.dart';
import 'core/localization/localization.dart';
import 'core/services/services.dart';
import 'firebase_options.dart';
late List<CameraDescription> cameras;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  cameras = await availableCameras();
  await initialServices();
  runApp(  const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    ThemeController themeController = Get.put(ThemeController());
    return Obx((){
     /* return GetBuilder<ThemeController>(
          builder: (themeController){*/
            return GetMaterialApp(
              themeMode: ThemeMode.dark,
              initialBinding: MyBindings(),
              getPages: appRoutes(),
              locale: controller.language,
              translations: MyTranslation(),
              debugShowCheckedModeBanner: false,
              theme: themeController.isDarkMode.value
                  ? ThemeData.dark()
                  : ThemeData.light(),

            );
    //  });
    });

  }
}

