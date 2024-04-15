import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:grad_proj/routes.dart';

import 'bindings.dart';
import 'core/class/them_controller.dart';
import 'core/localization/change_local.dart';
import 'core/localization/localization.dart';
import 'core/services/services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initialServices();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());
  get darkTheme => null;
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());


    return Obx(() =>
        GetMaterialApp(
          themeMode: ThemeMode.dark,
          initialBinding: MyBindings(),
          getPages: appRoutes(),
          locale: controller.language,
          translations: MyTranslation(),
          debugShowCheckedModeBanner: false,
          theme: themeController.isDarkMode.value
              ? ThemeData.dark()
              : ThemeData.light(),
          //theme: controller.theme,
          //theme: ThemeData(primarySwatch: Colors.blue),
          //darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.white),

        ),);
  }
}
