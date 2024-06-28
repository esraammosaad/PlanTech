import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Styles {
  static TextStyle textStyle18(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontFamily: 'RobotSlab',
        fontWeight: FontWeight.w800,
        height: 0,
      );
  static TextStyle textStyle10(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: getResponsiveFontSize(context, fontSize: 10),
        fontWeight: FontWeight.w700,
        height: 0,
      );
  static TextStyle textStyle20(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w800,
        height: 0,
      );
  static TextStyle textStyle25(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: getResponsiveFontSize(context, fontSize: 25),
        fontWeight: FontWeight.w500,
        height: 0,
      );
  static TextStyle textStyle30(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.w500,
        height: 0,
      );
  static TextStyle textStyle36(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: getResponsiveFontSize(context, fontSize: 28),
        fontWeight: FontWeight.w700,
        height: 0,
      );
  static TextStyle textStyle45(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: getResponsiveFontSize(context,
            fontSize: getValueForScreenType(
                context: context, mobile: 45, tablet: 80)),
        fontWeight: FontWeight.w700,
        height: 0,
      );
  static TextStyle textStyle17(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w600,
        height: 0,
      );
  static TextStyle textStyle12(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w300,
        height: 0,
      );
  static TextStyle textStyle14(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w500,
        height: 0,
      );
  static TextStyle textStyle16(BuildContext context) => TextStyle(
        color: AppColors.kPrimaryColor,
        fontSize: getResponsiveFontSize(context, fontSize: 17),
        fontWeight: FontWeight.w600,
        fontFamily: "RobetSlab",
        height: 0,
      );
}

// scaleFactor
// responsive font size
// (min , max) fontSize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * 1;
  double upperLimit = fontSize * 2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 550;
  } else {
    return width / 800;
  }
}
