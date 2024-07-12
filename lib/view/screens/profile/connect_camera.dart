import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/controller/bluetooth/bluetooth_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/view/widgets/camera/get_fab.dart';
import '../../../controller/bluetooth/live_stream_controller.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class ConnectCamera extends StatefulWidget {
  const ConnectCamera({
    super.key,
  });

  @override
  State<ConnectCamera> createState() => _ConnectCameraState();
}

class _ConnectCameraState extends State<ConnectCamera> {
  setLandscapeOrientation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }
  @override
  void initState() {
setLandscapeOrientation();
super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // setLandscapeOrientation();
      return Scaffold(
      appBar: customAppBar(context, text: 'Moving Camera'),
      body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GetBuilder<BluetoothControllerImp>(builder: (bluetoothController) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(bluetoothController.connectionText),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                bluetoothController.writeData('C');
                              },
                              child: Icon(
                                Icons.rotate_right,
                                color: AppColors.kPrimaryColor,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .white54, // Change background color here
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    bluetoothController.writeData('B');
                                  },
                                  child: Text(
                                    'Left',
                                    style: Styles.textStyle16(context),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .white54, // Change background color here
                                  ),
                                ),
                                SizedBox(width: 30),
                                ElevatedButton(
                                  onPressed: () {
                                    bluetoothController.writeData('A');
                                  },
                                  child: Text(
                                    'Right',
                                    style: Styles.textStyle16(context),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .white54, // Change background color here
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                bluetoothController.writeData('D');
                              },
                              child: Icon(
                                Icons.rotate_left,
                                color: AppColors.kPrimaryColor,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .white54, // Change background color here
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            bluetoothController.writeData('S');
                          },
                          child: Text(
                            'Stop',
                            style: Styles.textStyle16(context),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.white54, // Change background color here
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      floatingActionButton:
          GetBuilder<BluetoothControllerImp>(builder: (bluetoothController) {
        return SpeedDial(
          backgroundColor: AppColors.kPrimaryColor,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22, color: Colors.black),
          visible: true,
          curve: Curves.bounceIn,
          children: [
            SpeedDialChild(
              label: 'Scan Again',
              onTap: () => bluetoothController.startScan(),
              child: const Icon(Icons.restart_alt),
            ),
            SpeedDialChild(
              label: 'Stop Scan',
              onTap: () => bluetoothController.stopScan(),
              child: const Icon(
                Icons.stop_rounded,
                color: Colors.black,
              ),
            ),
            SpeedDialChild(
              label: 'Connect To Device',
              onTap: () => bluetoothController.connectToDevice(),
              child: const Icon(Icons.bluetooth_connected_outlined),
            ),
            SpeedDialChild(
              label: 'Disconnect From Device',
              onTap: () => bluetoothController.disconnectFromDevice(
                  device: bluetoothController.targetDevice),
              child: const Icon(Icons.disabled_by_default_outlined),
            ),
          ],
        );
      }),
    );
  }
}
//A =>Right
// B=> Left
// C => clockwise
// D=> anticlockwise
// S=> stop
//
