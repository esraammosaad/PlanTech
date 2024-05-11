import 'package:camera/camera.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/fonts.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/routes.dart';
import 'package:grad_proj/view/firebase_notification.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'bindings.dart';
import 'core/class/them_controller.dart';
import 'core/localization/change_local.dart';
import 'core/localization/localization.dart';
import 'core/services/services.dart';
import 'firebase_options.dart';

late List<CameraDescription> cameras;
/*Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("${message.notification!.body},${message.notification!.title}");
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotification().initNotification();
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  cameras = await availableCameras();
  await initialServices();
  runApp( DevicePreview(
      enabled: true,
      builder:(context)=>  MyApp()));
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  final GlobalKey <NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  void iniState(){
   /* FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('++++++++++++++++++++++++++++++}');
      if (message.notification != null) {
        print('===========================================}');
        print('Message also contained a notification:${message.notification!.body},${message.notification!.title}');
      }
    });*/
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('++++++++++++User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }
  /* void notificationHandel(){
    FirebaseMessaging.onMessage.listen((event){
      print(event.notification!.title);
    });

  }*/


  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    ThemeController themeController = Get.put(ThemeController());
    return ResponsiveApp(
        builder: (context) {
          return GetMaterialApp(
            navigatorKey: navigatorkey,
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