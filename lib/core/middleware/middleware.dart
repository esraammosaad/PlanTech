import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/core/services/services.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (FirebaseAuth.instance.currentUser!=null) {
      //FirebaseAuth.instance.authStateChanges()
      return RouteSettings(
        name: AppRoutes.navBarScreen,
      );
    }
    if (myServices.sharedPreferences.getString('onBoardingSeen') == '1') {
      return RouteSettings(
        name: AppRoutes.logInScreen,
      );
    }

    return null;
  }
}
