import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
      width: MediaQuery.of(context).size.height * 0.1,
      height: MediaQuery.of(context).size.height * 0.05,
      valueFontSize: 20,
      toggleSize: 26,
      value: status,
      borderRadius: 30.0,
      padding: 8.0,
      showOnOff: true,
      activeColor: Colors.black,
      onToggle: (val) {
        setState(() {
          status = val;
          themeController.toggleTheme();

        });
      },
    );
  }
}
