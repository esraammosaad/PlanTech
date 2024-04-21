import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/camera_controllers/camera_controller.dart';

class CustomCameraIcons extends StatelessWidget {
  const CustomCameraIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 28,
                )),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await controller.setFlash();
                  },
                  child: Icon(
                    controller.isFlashOn ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    await controller.flipCamera();
                  },
                  child: const Icon(
                    Icons.flip_camera_ios_outlined,
                    color: Colors.white,
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
