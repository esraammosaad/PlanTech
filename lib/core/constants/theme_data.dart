import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'fonts.dart';

ThemeController themeController=Get.put(ThemeController());

class ThemeServicesController extends GetxController{
  static ThemeData themeEnglish = ThemeData(

      fontFamily: AppFonts.kPrimaryFont,
      brightness:themeController.isDarkMode.value?Brightness.dark:Brightness.light,
      useMaterial3: true,
    );
  static  ThemeData themeArabic = ThemeData(
    fontFamily: AppFonts.kArabicFont,
    brightness: themeController.isDarkMode.value?Brightness.dark:Brightness.light,
    useMaterial3: true,
  );
}





