import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:get/get.dart';
import '../../widgets/splash/custom_animation_builder.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    splashViewAnimation();
    navigationToSplashOneView();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CustomAnimationBuilder(
              animationController: animationController,
              slidingAnimation: slidingAnimation,
            ),
          ],
        ),
      ),
    );
  }

  void navigationToSplashOneView() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Get.toNamed(AppRoutes.chooseLanguageScreen);
      },
    );
  }

  void splashViewAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation = Tween(begin: const Offset(0, 2), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }
}
