import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/bindings.dart';
import 'package:grad_proj/core/localization/change_local.dart';
import 'package:grad_proj/core/localization/localization.dart';
import 'package:grad_proj/core/services/services.dart';
import 'package:grad_proj/routes.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(

      initialBinding: MyBindings(),
      getPages: appRoutes(),
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      theme: controller.theme,

    );
  }
}
