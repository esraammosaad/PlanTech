import 'package:flutter/animation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/core/middleware/middleware.dart';
import 'package:grad_proj/view/screens/auth/forget_password.dart';
import 'package:grad_proj/view/screens/auth/login.dart';
import 'package:grad_proj/view/screens/auth/otp.dart';
import 'package:grad_proj/view/screens/auth/signup.dart';
import 'package:grad_proj/view/screens/auth/signup_with_phone_number.dart';
import 'package:grad_proj/view/screens/camera/camera.dart';
import 'package:grad_proj/view/screens/camera/camera_tips.dart';
import 'package:grad_proj/view/screens/community/add_post.dart';
import 'package:grad_proj/view/screens/community/edit_post.dart';
import 'package:grad_proj/view/screens/community/popular_questions.dart';
import 'package:grad_proj/view/screens/community/post_details.dart';
import 'package:grad_proj/view/screens/community/see_all_popular_questions.dart';
import 'package:grad_proj/view/screens/camera/camera_result.dart';
import 'package:grad_proj/view/screens/home/nav_bar.dart';
import 'package:grad_proj/view/screens/plants_details/care_guide.dart';
import 'package:grad_proj/view/screens/plants_details/plants_details.dart';
import 'package:grad_proj/view/screens/home/see_all_plants.dart';
import 'package:grad_proj/view/screens/landing/on_boarding.dart';
import 'package:grad_proj/view/screens/landing/splash.dart';
import 'package:grad_proj/view/screens/language/choose_language.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> appRoutes() {
  return [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const Splash(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.fade,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.chooseLanguageScreen,
      page: () => const ChooseLanguage(),
      middlewares: [
        MyMiddleware(),
      ],
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.onBoardingScreen,
      page: () => const OnBoarding(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.logInScreen,
      page: () => const LogIn(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => const SignUp(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.forgetPasswordScreen,
      page: () => const ForgetPassword(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.otpScreen,
      page: () => const OneTimePassword(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.signUpWithPhoneNumberScreen,
      page: () => const SignUpWithPhoneNumber(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.navBarScreen,
      page: () => const NavBar(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(seconds: 2),
        curve: Curves.easeInExpo
    ),
    GetPage(
      name: AppRoutes.plantsDetailsScreen,
      page: () => const PlantsDetails(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.addPostScreen,
      page: () => const AddPost(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.postDetailsScreen,
      page: () => const PostDetails(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.seeAllScreen,
      page: () => const SeeAllPlants(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.editPostScreen,
      page: () => const EditPost(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.seeAllPopularQuestionsScreen,
      page: () => const SeeAllPopularQuestions(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.popularQuestionsScreen,
      page: () => const PopularQuestions(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
      name: AppRoutes.careGuideScreen,
      page: () => const CareGuide(),
        transitionDuration: const Duration(milliseconds: 900),
        transition: Transition.cupertino,
        curve: Curves.decelerate
    ),
    GetPage(
        name: AppRoutes.cameraScreen,
        page: () => const Camera(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1),
        curve: Curves.easeInExpo),
    GetPage(
        name: AppRoutes.cameraResultScreen,
        page: () => const CameraResult(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(seconds: 1),
        curve: Curves.easeInExpo),
    GetPage(
        name: AppRoutes.cameraTipsScreen,
        page: () => const CameraTips(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(seconds: 1),
        curve: Curves.easeInExpo),
  ];
}
