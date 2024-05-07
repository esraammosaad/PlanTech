import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/core/constants/color.dart';
import '../../../controller/camera_controllers/camera_controller.dart';
import 'custom_camera_button.dart';
import 'custom_icons_column_camera.dart';

class CustomCameraContainer extends StatelessWidget {
  const CustomCameraContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GetBuilder<OpenCameraControllerImpl>(builder: (controller) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.2,
          decoration: BoxDecoration(
            color: themeController.isDarkMode.value
                ? Colors.black54
                : Colors.white70,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomIconsColumnCamera(
                text: 'Gallery',
                icon: Icons.photo,
                onTap: () async {
                  await controller.pickPhotoFromGallery();
                  controller.image != null
                      ? Get.toNamed(AppRoutes.cameraResultScreen,
                          arguments: [controller.image])
                      : null;
                },
              ),
              Center(
                child: controller.isLoading
                    ? CircularProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      )
                    : CustomCameraButton(
                        onTap: () async {
                          await controller.takePhoto();
                          controller.image != null
                              ? Get.toNamed(AppRoutes.cameraResultScreen,
                                  arguments: [controller.image])
                              : null;
                        },
                      ),
              ),
              CustomIconsColumnCamera(
                text: 'Tips',
                icon: Icons.help_outline,
                onTap: () {
                  Get.toNamed(AppRoutes.cameraTipsScreen);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
