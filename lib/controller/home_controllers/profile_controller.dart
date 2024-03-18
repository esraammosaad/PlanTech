import 'package:get/get.dart';
import 'package:grad_proj/core/constants/app_routes.dart';

import '../../data/data_source/remote/auth_repo/auth_repo_imp.dart';

abstract class ProfileController extends GetxController {

  logOut();
}

class ProfileControllerImpl extends ProfileController {
  AuthRepoImp authRepo = Get.find();

  List<String> profileList = [
    'Personal Information',
    'Payments',
    'Orders and Reviews',
    'Notifications',
    'Settings',
    'Support',
    'About Us',
    'Logout'
  ];

  @override
  logOut() {
    authRepo.logOut();
    Get.offAllNamed(AppRoutes.logInScreen);
  }
}
