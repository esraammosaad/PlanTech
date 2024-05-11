import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../widgets/camera/custom_bad_photos_row.dart';
import '../../widgets/camera/custom_snap_tips_good_photo.dart';
import '../../widgets/home/custom_material_button.dart';

class CameraTips extends StatelessWidget {
  const CameraTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Snap Tips',
              style: getValueForScreenType(
                  context: context,
                  mobile: Styles.textStyle25(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black),
                  tablet: Styles.textStyle45(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,fontWeight: FontWeight.w300)),
            ),
            const SizedBox(
              height: 32,
            ),
            const CustomSnapTipsGoodPhoto(),
            const SizedBox(
              height: 25,
            ),
            const CustomBadPhotosRow(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getValueForScreenType(
                      context: context, tablet: 150, mobile: 0)),
              child: CustomMaterialButton(
                onPressed: () {
                  Get.back();
                },
                text: 'Continue',
              ),
            )
          ],
        ),
      ),
    );
  }
}
