import 'package:flutter/material.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/bluetooth/live_stream_controller.dart';
class CustomLiveStreamingWidget extends StatelessWidget {
  const CustomLiveStreamingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveStreamControllerImp>(
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureZoomBox(
                  maxScale: 5,
                  doubleTapScale: 2,
                  duration: Duration(milliseconds: 200),
                  child: Image.asset(//controller.image
                    'assets/images/home3.jpeg',
                    height: controller.newVideoSizeHeight,
                    width: controller.newVideoSizeWidth,
                  )),
            ],
          );
        }
    );
  }
}
