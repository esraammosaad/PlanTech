import 'package:flutter/material.dart';
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
                    child: controller.image==null?SizedBox(
                      height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Center()):Image.memory(
                      controller.image!,

                      width: MediaQuery.of(context).size.height,
                      height: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 16),
                  child: GetBuilder<BluetoothControllerImp>(
                    builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.end ,
                              children: [
                                ElevatedButton(

                                  onPressed: (){
                                    controller.writeData('C');
                                  },
                                  child: Icon(Icons.rotate_right,color: AppColors.kPrimaryColor,),
                                  style:ElevatedButton.styleFrom(
                                    backgroundColor:Colors.white54,  // Change background color here
                                  ) ,
                                ),
                                SizedBox(height: 8,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(

                                      onPressed: (){
                                        controller.writeData('B');
                                      },
                                      child: Text('Left',style: Styles.textStyle16(context),),
                                      style:ElevatedButton.styleFrom(
                                        backgroundColor:Colors.white54,  // Change background color here
                                      ) ,
                                    ),
                                    SizedBox(width: 40),
                                    ElevatedButton(
                                      onPressed: (){
                                        controller.writeData('A');

                                      },
                                      child: Text('Right',style: Styles.textStyle16(context),),
                                      style:ElevatedButton.styleFrom(
                                        backgroundColor:Colors.white54,  // Change background color here
                                      ) ,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8,),
                                ElevatedButton(

                                  onPressed: (){
                                    controller.writeData('D');
                                  },
                                  child: Icon(Icons.rotate_left,color: AppColors.kPrimaryColor,),
                                  style:ElevatedButton.styleFrom(
                                    backgroundColor:Colors.white54,  // Change background color here
                                  ) ,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0,top: 110,left: 60),

                            child: ElevatedButton(

                              onPressed: (){
                                controller.writeData('S');
                              },
                              child: Text('Stop',style: Styles.textStyle16(context),),
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Colors.white54,  // Change background color here
                              ) ,
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
//A =>Right
// B=> Left
// C => clockwise
// D=> anticlockwise
// S=> stop