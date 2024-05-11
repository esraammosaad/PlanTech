import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  MyServices myServices = Get.find();
  void toggleTheme(bool value) {
    isDarkMode.value = value;
    myServices.sharedPreferences.setBool('themeMode', isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
  @override
  void onInit() {
    super.onInit();
    bool? mode = myServices.sharedPreferences.getBool('themeMode');
    if (mode==true) {
      toggleTheme(true);
      isDarkMode.value=true;
    } else if (mode==false) {
      toggleTheme(false);
      isDarkMode.value=false;
    } else {
      isDarkMode.value=false;
      toggleTheme(false);
    }
  }
}
