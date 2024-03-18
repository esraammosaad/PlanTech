import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/core/middleware/middleware.dart';
import 'package:grad_proj/view/screens/auth/forget_password.dart';
import 'package:grad_proj/view/screens/auth/login.dart';
import 'package:grad_proj/view/screens/auth/otp.dart';
import 'package:grad_proj/view/screens/auth/signup.dart';
import 'package:grad_proj/view/screens/auth/signup_with_phone_number.dart';
import 'package:grad_proj/view/screens/home/home.dart';
import 'package:grad_proj/view/screens/home/nav_bar.dart';
import 'package:grad_proj/view/screens/landing/on_boarding.dart';
import 'package:grad_proj/view/screens/landing/splash.dart';
import 'package:grad_proj/view/screens/language/choose_language.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> appRoutes() {
  return [
    GetPage(name: AppRoutes.splashScreen, page: () => const Splash()),
    GetPage(
        name: AppRoutes.chooseLanguageScreen,
        page: () => const ChooseLanguage(),
        middlewares: [MyMiddleware()]),
    GetPage(name: AppRoutes.onBoardingScreen, page: () => const OnBoarding()),
    GetPage(name: AppRoutes.logInScreen, page: () => const LogIn()),
    GetPage(name: AppRoutes.signUpScreen, page: () => const SignUp()),
    GetPage(
        name: AppRoutes.forgetPasswordScreen,
        page: () => const ForgetPassword()),
    GetPage(name: AppRoutes.otpScreen, page: () => const OneTimePassword()),
    GetPage(
        name: AppRoutes.signUpWithPhoneNumberScreen,
        page: () => const SignUpWithPhoneNumber()),
    GetPage(
        name: AppRoutes.homeScreen,
        page: () => const Home()), GetPage(
        name: AppRoutes.navBarScreen,
        page: () => const NavBar()),
  ];
}
