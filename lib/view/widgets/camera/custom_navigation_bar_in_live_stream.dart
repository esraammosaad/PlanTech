import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/controller/bluetooth/capture_image_controller.dart';
import 'package:iconly/iconly.dart';
import '../../../controller/bluetooth/live_stream_controller.dart';
import '../../../core/class/them_controller.dart';
class CustomNavigationBarInLiveStream extends StatelessWidget {
  const CustomNavigationBarInLiveStream({
    super.key,
    required this.themeController,
  });

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CaptureImageControllerImp>(
        builder: (controller) {
          return Column(
            children: [
              Container(
                color: themeController.isDarkMode.value
                    ? Colors.black
                    : Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        IconlyLight.camera,
                        size: 24,
                      ),
                      onPressed: () {
                        controller.captureImage();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.stop_circle_outlined,
                        size: 24,
                      ),
                      onPressed: () {
                        // controller.stopLiveStream();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.fullscreen,
                        size: 24,
                      ),
                      onPressed: () {
                        // controller.isFullScreen = true;

                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }
    );
  }
}
