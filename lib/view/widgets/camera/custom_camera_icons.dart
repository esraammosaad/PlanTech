import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../controller/camera_controllers/camera_controller.dart';

class CustomCameraIcons extends StatelessWidget {
  const CustomCameraIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=Get.find();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GetBuilder<OpenCameraControllerImpl>(builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  controller.close();
                },
                child:  Icon(
                  Icons.close,
                  color: themeController.isDarkMode.value?Colors.black54:Colors.white,
                  size:getValueForScreenType(context: context, mobile: 28,tablet: 50),
                )),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await controller.setFlash();
                  },
                  child: Icon(
                    controller.isFlashOn ? Icons.flash_on : Icons.flash_off,
                    color: themeController.isDarkMode.value?Colors.black54:Colors.white,
                    size: getValueForScreenType(context: context, mobile: 24,tablet: 50),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    await controller.flipCamera();
                  },
                  child:  Icon(
                    Icons.flip_camera_ios_outlined,
                    color: themeController.isDarkMode.value?Colors.black54:Colors.white,
                    size: getValueForScreenType(context: context, mobile: 24,tablet: 50),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
