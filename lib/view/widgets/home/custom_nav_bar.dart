import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/nav_bar_controller.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GetBuilder<NavBarControllerImp>(
      builder: (controller) => Obx(() {
        return AnimatedBottomNavigationBar(
          // height: 80,
          elevation: 0,

          backgroundColor:
          themeController.isDarkMode.value ? Colors.black26 : Colors.white,
          icons: const [
            IconlyLight.home,
            IconlyLight.user_1,
            Iconsax.tree,
            IconlyLight.setting,
          ],
          iconSize: 27,

          // indicatorColor: AppColors.kPrimaryColor,
          // indicatorShape: UnderlineInputBorder(),

          activeColor: AppColors.kPrimaryColor,
          inactiveColor: AppColors.greyColor,
          activeIndex: controller.selectedPage,
          gapLocation: GapLocation.center,
          notchMargin: 0,
          notchSmoothness: NotchSmoothness.sharpEdge,

          onTap: (int index) {
            controller.navBar(index);
            controller.pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);
          },
          //other params
        );
      }),
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
      const EdgeInsets.only(bottom: 50.0), // Adjust this padding as needed
      child: ExpandableFab(
        distance: 100,
        children: [
          ActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.cameraScreen);
            },
            icon: const Icon(IconlyLight.camera),
          ),
          ActionButton(
            onPressed: () {

              Get.toNamed(AppRoutes.liveStreamingScreen);


            },
            icon: const Icon(Icons.play_circle_filled_outlined),
          ),
          ActionButton(

            onPressed: () {

              Get.toNamed(AppRoutes.imageStreamingScreen);

            },
            icon: const Icon(Icons.image),
          ),
          ActionButton(

            onPressed: () {

              Get.toNamed(AppRoutes.captureImageScreen);

            },
            icon: const Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
       EdgeInsets.only(bottom: MediaQuery.of(context).size.height/35), // Adjust this padding as needed
      child: SizedBox.expand(
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            _buildTapToCloseFab(),
            ..._buildExpandingActionButtons(),
            _buildTapToOpenFab(),
          ],
        ),
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final startAngleDegrees = 45.0; // Start angle at 45 degrees
    final step = 90.0 / (count - 1); // Spread over 90 degrees

    for (var i = 0, angleInDegrees = startAngleDegrees;
    i < count;
    i++, angleInDegrees += step) {
      final angleInRadians = angleInDegrees * (math.pi / 180.0);
      final offset = Offset(math.cos(angleInRadians) * widget.distance,
          math.sin(angleInRadians) * widget.distance);

      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
          offset: offset,
        ),
      );
    }

    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            onPressed: _toggle,
            child: const Icon(
              IconlyLight.play,
              color: Colors.black,
              size: 30,
            ),
            backgroundColor: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
    required this.offset,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        return Positioned(
          left: (MediaQuery.of(context).size.width / 2) +
              offset.dx -
              28, // Adjust to position relative to FAB center
          bottom: offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: FadeTransition(
              opacity: progress,
              child: child!,
            ),
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();

    return Obx(
        ()=> Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        color: themeController.isDarkMode.value?Colors.black:AppColors.backgroundColor,
        elevation: 4,
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}

//BottomNavigationBar( backgroundColor: const Color(0xffF4F4F4),items:  [
//
//         BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house,color:  AppColors.kGreyColor,),label: '',),
//         BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.peopleGroup,color: AppColors.kGreyColor,),label: ''),
//         BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.camera,color: AppColors.kGreyColor,),label: ''),
//         BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.bluetooth,color: AppColors.kGreyColor,),label: ''),
//         BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.person,color: AppColors.kGreyColor,),label: ''),
//
//       ],selectedItemColor: AppColors.kPrimaryColor,iconSize: 20,currentIndex: controller.selectedPage, onTap: (int index) {
//            controller.navBar(index);
//            controller.pageController.jumpToPage(index);
//        }, )

//BottomBarCreative(
//         enableShadow: true,
//         items: const [
//           TabItem(
//             icon: Icons.home_rounded,
//           ),
//           TabItem(
//             icon: Icons.groups,
//           ),
//           TabItem(
//             icon: FontAwesomeIcons.camera,
//           ),
//           TabItem(
//             icon: Icons.bluetooth_searching_outlined,
//           ),
//           TabItem(
//             icon: FontAwesomeIcons.personCircleCheck,
//           ),
//         ],
//         borderRadius: const BorderRadius.only(
//             topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//         backgroundColor: const Color(0xffF4F4F4),
//         iconSize: 25,
//         color: AppColors.kGreyColor,
//         colorSelected: AppColors.kPrimaryColor,
//         indexSelected: controller.selectedPage,
//
//
//         onTap: (int index) {
//           controller.navBar(index);
//           controller.pageController.jumpToPage(index);
//         },
//         isFloating: true,
//       )