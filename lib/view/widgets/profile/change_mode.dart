import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/color.dart';

import '../../../core/class/them_controller.dart';

class ChangeMode extends StatefulWidget {
  const ChangeMode({super.key});

  @override
  State<ChangeMode> createState() => _ChangeModeState();
}

class _ChangeModeState extends State<ChangeMode> {
  bool status = false;
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return  FlutterSwitch(
      width: 45,
      height: 30,
      valueFontSize: 16,
      toggleSize: 16,
      value: status,
      borderRadius: 20.0,
      padding: 8.0,
      //showOnOff: true,
      activeColor: Colors.black,
      inactiveColor:AppColors.kPrimaryColor,
      onToggle: (val) {
        setState(() {
          status = val;
          themeController.toggleTheme();

         // print('${themeController.isDarkMode.value}');

        });
      },
    );
  }
}
