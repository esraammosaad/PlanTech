import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showAwesomeDialog({
  required BuildContext context,
  required DialogType dialogType,
  required String title,
  required String desc,
  required VoidCallback okOnPress,
  required VoidCallback cancelOnPress
}) {
  AwesomeDialog(
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
    btnOkOnPress: okOnPress,
    btnCancelOnPress: cancelOnPress,

    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,

  ).show();
}