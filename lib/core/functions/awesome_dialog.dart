import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

Future<void> showAwesomeDialog({
  required BuildContext context,
  required DialogType dialogType,
  required String title,
  required String desc,
  required VoidCallback okOnPress,
  required VoidCallback cancelOnPress
}) async {
  await AwesomeDialog(
    width: getValueForScreenType<double>(context: context, tablet:MediaQuery.sizeOf(context).width/1.5, mobile: MediaQuery.sizeOf(context).width ),
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