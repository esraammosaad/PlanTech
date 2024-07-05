import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/controller/bluetooth/bluetooth_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import '../../../controller/bluetooth/live_stream_controller.dart';

class FullScreenLiveStreamWidget extends StatelessWidget {
  const FullScreenLiveStreamWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveStreamControllerImp>(builder: (controller) {
      return OrientationBuilder(builder: (context, orientation) {
        controller.landScapeVideoSize(context, orientation);
        return RotatedBox(
            quarterTurns: controller.isLandscape ? 0 : 45,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                GestureZoomBox(
                    maxScale: 5,
                    doubleTapScale: 2,
                    duration: Duration(milliseconds: 200),
                    child: Image.asset(
                      'assets/images/home3.jpeg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 16),
                  child: GetBuilder<BluetoothControllerImp>(
                    builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Joystick(
                            period: Duration(seconds: 1),
                            includeInitialAnimation: false,
                            stick:  CircleAvatar(
                              backgroundColor: AppColors.kPrimaryColor,
                              radius: 20,

                            ),
                            base: Container(
                              width: 180,
                              height: 180,
                              decoration:  BoxDecoration(
                                color:Colors.grey.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                            ),
                            listener: (details) {
                              print((atan2(details.y, details.x) * 180 / pi + 360) % 360);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 65.0,top: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(

                                  onPressed: (){
                                  },
                                  child: Text('Left',style: Styles.textStyle16(context),),
                                  style:ElevatedButton.styleFrom(
                                    backgroundColor:Colors.grey.withOpacity(0.5),  // Change background color here
                                  ) ,
                                ),
                                SizedBox(width: 20),
                                ElevatedButton(
                                  onPressed: (){

                                  },
                                  child: Text('Right',style: Styles.textStyle16(context),),
                                  style:ElevatedButton.styleFrom(
                                    backgroundColor:Colors.grey.withOpacity(0.5),  // Change background color here
                                  ) ,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
              ],
            ));
      });
    });
  }
}
