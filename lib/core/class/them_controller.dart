import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:grad_proj/core/class/themedata.dart';
import 'package:grad_proj/core/services/preferanceManager.dart';
import 'package:grad_proj/core/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {

  void saveThemeMode(bool isDarkMode) async {
     PreferencesManager.instance.setBool('isDarkMode', isDarkMode);
  }
  RxBool isDarkMode = false.obs;
  void toggleTheme() {
    final bool currentmode = !isDarkMode.value;
    isDarkMode.toggle().update((val) {});
    PreferencesManager.instance.setBool('isDarkMode', currentmode);

  }
}
/*
class ThemeProvider extends GetxController {
  Rx<ThemeData> themeData = darkTheme.obs;

  void toggleTheme() {
    if (themeData.value == darkTheme) {
      themeData.value = lightTheme;

    } else {
      themeData.value = darkTheme;

    }
  }
}*/
