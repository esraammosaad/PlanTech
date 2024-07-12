import 'package:flutter/material.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
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
                  child: controller.image==null?SizedBox(
                    height: MediaQuery.of(context).size.height/3,
                    child: Center(child: SizedBox(

                        child: CircularProgressIndicator(color: AppColors.kPrimaryColor,))),
                  ):Image.memory(controller.image!,width: MediaQuery.of(context).size.width,gaplessPlayback: true, )


              ) ,

            ],
          );
        }
    );
  }
}
