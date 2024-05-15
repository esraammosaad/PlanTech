import 'package:camera/camera.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/fonts.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/routes.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'bindings.dart';
import 'core/class/them_controller.dart';
import 'core/localization/change_local.dart';
import 'core/localization/localization.dart';
import 'core/services/services.dart';
import 'firebase_options.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  cameras = await availableCameras();
  await initialServices();
  runApp( DevicePreview(
    enabled: true,
      builder:(context)=> const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    ThemeController themeController = Get.put(ThemeController());
    return ResponsiveApp(
      builder: (context) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          initialBinding: MyBindings(),
          getPages: appRoutes(),
          // locale: controller.language,
          translations: MyTranslation(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: AppFonts.kPrimaryFont, brightness: Brightness.light),
          darkTheme: ThemeData(
            fontFamily: AppFonts.kPrimaryFont,
            appBarTheme: AppBarTheme(
              titleTextStyle: Styles.textStyle20(context).copyWith(color: Colors.white70),
            ),
            brightness: Brightness.dark,
          ),
        );
      }
    );
  }
}
