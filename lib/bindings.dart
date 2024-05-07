import 'package:grad_proj/controller/camera_controllers/camera_controller.dart';
import 'package:grad_proj/controller/camera_controllers/model_controller.dart';
import 'package:grad_proj/controller/camera_controllers/my_garden_controller.dart';
import 'package:grad_proj/controller/community_controllers/add_post_controller.dart';
import 'package:grad_proj/controller/community_controllers/see_all_questions_controller.dart';
import 'package:grad_proj/controller/home_controllers/home_controller.dart';
import 'package:grad_proj/controller/home_controllers/nav_bar_controller.dart';
import 'package:grad_proj/controller/plants_details_controllers/care_guide_controller.dart';
import 'package:grad_proj/controller/plants_details_controllers/plants_details_controller.dart';
import 'package:grad_proj/controller/community_controllers/post_details_controller.dart';
import 'package:grad_proj/controller/profile_controllers/edit_profile_controller.dart';
import 'package:grad_proj/controller/profile_controllers/my_profile_controller.dart';
import 'package:grad_proj/core/class/api_service.dart';
import 'package:grad_proj/core/class/firebase_auth_services.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/data/data_source/remote/my_garden_repo/my_garden_repo_impl.dart';
import 'package:grad_proj/data/data_source/remote/post_repo/post_repo_impl.dart';
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
import 'controller/community_controllers/edit_comments_controller.dart';
import 'controller/community_controllers/edit_post_controller.dart';
import 'controller/community_controllers/plants_community_controller.dart';
import 'controller/home_controllers/see_all_controller.dart';
import 'data/data_source/remote/popular_questions_repo/popular_questions_repo_impl.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordControllerImp(),fenix: true);
    Get.lazyPut(() => SignInControllerImp(),fenix: true);
    Get.lazyPut(() => SignUpControllerImp(),fenix: true);
    Get.lazyPut(()=>OtpControllerImp(),fenix: true);
    Get.lazyPut(()=>SignUpWthPhoneNumControllerImp(),fenix: true);
    Get.lazyPut(()=>NavBarControllerImp(),fenix: true);
    Get.lazyPut(()=>AddPostControllerImp(),fenix: true);
    Get.lazyPut(()=>PostDetailsControllerImp(),fenix: true);
    Get.lazyPut(()=>OpenCameraControllerImpl(),fenix: true);
    Get.lazyPut(()=>ModelControllerImpl(),fenix: true);
    Get.lazyPut(()=>MyGardenControllerImp(),fenix: true);
    Get.put(FirebaseAuthServices());
    Get.put(ThemeController());
    Get.put(AuthRepoImp());
    Get.put(UpdateUserData());
    Get.put(ApiService());
    Get.put(PlantsDetailsRepoImpl());
    Get.put(HomeRepoImpl());
    Get.put(PopularQuestionsRepoImpl());
    Get.put(PostsRepoImpl());
    Get.put(MyGardenRepoImpl());
    Get.put(HomeControllerImp(),permanent: true);
    Get.put(SeeAllControllerImp(),permanent: true);
    Get.put(EditAndDeletePostControllerImp(),permanent: true);
    Get.put(EditAndDeleteCommentControllerImp(),permanent: true);
    Get.put(PlantsCommunityControllerImp(),permanent: true);
    Get.put(PlantsDetailsControllerImp(),permanent: true);
    Get.put(SeeAllQuestionsControllerImp(),permanent: true);
    Get.put(CareGuideControllerImp(),permanent: true);
    Get.put(EditProfileControllerImpl(),permanent: true);
    Get.put(MyProfileControllerImp(),permanent: true);






  }
}
