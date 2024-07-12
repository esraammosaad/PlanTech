import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../core/constants/color.dart';
class GetFab extends StatelessWidget {
  const GetFab({Key? key, required this.isLandscape, required this.onTapFullScreen, required this.isFullScreen}) : super(key: key);
  final bool isLandscape;
  final VoidCallback onTapFullScreen;
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: AppColors.kPrimaryColor,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22,color: Colors.black),
      visible: isLandscape,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.photo_camera),
          onTap: () {},
        ),
        SpeedDialChild(child: Icon(Icons.stop_circle_outlined), onTap: () {}),
        SpeedDialChild(child: Icon(
          isFullScreen?Icons.fullscreen_exit:Icons.fullscreen,
          size: 24,
        ),
          onTap: onTapFullScreen,),
      ],
    );
  }
}
