import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/theme_data.dart';
import 'package:grad_proj/core/services/services.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  ThemeData theme=ThemeServicesController.themeEnglish;
  MyServices myServices = Get.find();
  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    langCode=='ar'?theme=ThemeServicesController.themeArabic:theme=ThemeServicesController.themeEnglish;
    myServices.sharedPreferences.setString('lang', langCode);
    Get.changeTheme(theme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    super.onInit();
    String? code = myServices.sharedPreferences.getString('lang');
    if (code == 'ar') {
      language = const Locale('ar');
      theme=ThemeServicesController.themeArabic;
    } else if (code == 'en') {
      language = const Locale('en');
      theme=ThemeServicesController.themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}
