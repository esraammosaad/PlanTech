import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/camera_controllers/camera_controller.dart';
import '../../widgets/camera/custom_camera_container.dart';
import '../../widgets/camera/custom_camera_icons.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GetBuilder<OpenCameraControllerImpl>(builder: (controller) {
            return Stack(
              children: [
                CameraPreview(controller.controller),
                const CustomCameraIcons(),
                const CustomCameraContainer()
              ],
            );
          }),
        ),
      ),
    );
  }
}

