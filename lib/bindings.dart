import 'package:grad_proj/controller/home_controllers/add_post_controller.dart';
import 'package:grad_proj/controller/home_controllers/home_controller.dart';
import 'package:grad_proj/controller/home_controllers/nav_bar_controller.dart';
import 'package:grad_proj/controller/home_controllers/plants_community_controller.dart';
import 'package:grad_proj/controller/home_controllers/plants_details_controller.dart';
import 'package:grad_proj/controller/home_controllers/post_details_controller.dart';
import 'package:grad_proj/controller/home_controllers/profile_controller.dart';
import 'package:grad_proj/controller/home_controllers/see_all_controller.dart';
import 'package:grad_proj/core/class/api_service.dart';
import 'package:grad_proj/core/class/firebase_auth_services.dart';
import 'package:grad_proj/core/class/posts_services.dart';
import 'package:grad_proj/core/class/update_user_data.dart';
import 'package:grad_proj/data/data_source/remote/auth_repo/auth_repo_imp.dart';
import 'package:grad_proj/data/data_source/remote/home_repo/home_repo_impl.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/data_source/remote/plants_details_repo/plants_details_repo_impl.dart';
import 'controller/auth_controllers/forget_password_controller.dart';
import 'controller/auth_controllers/otp_controller.dart';
import 'controller/auth_controllers/signin_controller_imp.dart';
import 'controller/auth_controllers/signup_controller_imp.dart';
import 'controller/auth_controllers/signup_with_phone_number_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordControllerImp(),fenix: true);
    Get.lazyPut(() => SignInControllerImp(),fenix: true);
    Get.lazyPut(() => SignUpControllerImp(),fenix: true);
    Get.lazyPut(()=>OtpControllerImp(),fenix: true);
    Get.lazyPut(()=>SignUpWthPhoneNumControllerImp(),fenix: true);
    Get.lazyPut(()=>NavBarControllerImp(),fenix: true);
    Get.lazyPut(()=>HomeControllerImp(),fenix: true);
    Get.lazyPut(()=>PlantsDetailsControllerImp(),fenix: true);
    Get.lazyPut(()=>PlantsCommunityControllerImp(),fenix: true);
    Get.lazyPut(()=>AddPostControllerImp(),fenix: true);
    Get.lazyPut(()=>ProfileControllerImpl(),fenix: true);
    Get.lazyPut(()=>PostDetailsControllerImp(),fenix: true);
    Get.lazyPut(()=>SeeAllControllerImp(),fenix: true);
    Get.put(FirebaseAuthServices());
    Get.put(AuthRepoImp());
    Get.put(UpdateUserData());
    Get.put(ApiService());
    Get.put(PlantsDetailsRepoImpl());
    Get.put(HomeRepoImpl());
    Get.put(PostsRepo());




  }
}
