import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/bluetooth/capture_image_controller.dart';
import 'package:grad_proj/controller/camera_controllers/model_controller.dart';
import 'package:intl/intl.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

import '../camera_controllers/camera_controller.dart';

abstract class LiveStreamController extends GetxController {
  connectToSignalR();
  handleIncomingFrame(List<Object?>? parameters);
  stopLiveStream();
  captureImage();
}

class LiveStreamControllerImp extends LiveStreamController {
  final double videoWidth = 640;
  final double videoHeight = 480;

  double newVideoSizeWidth = 640;
  double newVideoSizeHeight = 480;

  bool isLandscape = false;
  bool isFullScreen = false;

  String? timeString;
  final serverUrl =
      "https://planethealth.azurewebsites.net/detection?type=flutter";
  late HubConnection hubConnection;
  Image? image;
  int _totalChunks = 0;
  int _receivedChunks = 0;
  List<Uint8List> _imageChunks = [];
  bool isLoading = true;
  File? capturedImage;
  String? result;
  double? accuracy;
  int check=0;

  @override
  void connectToSignalR() async {
    try {
      hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();

      hubConnection.onclose(({error}) {
        debugPrint('Connection closed: ${error?.toString()}');
        Future.delayed(const Duration(seconds: 5), () {
          if (hubConnection.state != HubConnectionState.Connected) {
            connectToSignalR();
          }
        });
      });

      hubConnection.on("ReceiveFrame", handleIncomingFrame);

      await hubConnection.start()?.timeout(const Duration(seconds: 10));
      await hubConnection.invoke("GetLiveStream");

      debugPrint('Connection started');
      isLoading=false;
      update();
    } on TimeoutException catch (_) {
      debugPrint('Connection attempt timed out. Retrying...');
      connectToSignalR();
      isLoading=false;
      update();
    } on Exception catch (e) {
      debugPrint('Connection error: ${e.toString()}');
      isLoading=false;
      update();
    }
  }

  @override
  handleIncomingFrame(List<Object?>? parameters) {
    if (parameters != null && parameters.isNotEmpty) {
      final chunk = parameters[0] as String;
      final index = parameters[1] as int;
      final totalChunks = parameters[2] as int;

      if (_totalChunks != totalChunks) {
        _totalChunks = totalChunks;
        _receivedChunks = 0;
        _imageChunks = List<Uint8List>.filled(totalChunks, Uint8List(0));
      }

      final imageBytes = base64Decode(chunk);
      _imageChunks[index] = imageBytes;
      _receivedChunks++;
      if (_receivedChunks == _totalChunks) {
        final completeImageBytes =
            Uint8List.fromList(_imageChunks.expand((chunk) => chunk).toList());

        image = Image.memory(
          completeImageBytes,
          gaplessPlayback: true,
        );
        update();

        debugPrint(
            "Complete image received with bytes: ${completeImageBytes.length}");
      } else {
        debugPrint(
            "Received frame chunk $index / $totalChunks with bytes: ${imageBytes.length}");
      }
    } else {
      debugPrint("No Frames received");
    }
  }

  @override
  void stopLiveStream() async {
    try {
      await hubConnection.invoke("StopLiveStream");
      debugPrint('Live stream Stop');
      isLoading=false;
      update();
    } on Exception catch (e) {
      debugPrint('Error starting Live stream: ${e.toString()}');
      isLoading=false;
      update();
    }
  }
  String formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd hh:mm:ss aaa').format(dateTime);
  }

  void getTime() {
    final DateTime now = DateTime.now();

    timeString = formatDateTime(now);
    update();
  }

  fullScreenFunction() {
    isFullScreen = !isFullScreen;
    update();
  }

  landScapeVideoSize(BuildContext context, Orientation orientation) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    if (orientation == Orientation.portrait) {
      //screenWidth < screenHeight
      isLandscape = false;
      newVideoSizeWidth = screenWidth > videoWidth ? videoWidth : screenWidth;
      newVideoSizeHeight = videoHeight * newVideoSizeWidth / videoWidth;
    } else {
      isLandscape = true;
      newVideoSizeHeight =
          screenHeight > videoHeight ? videoHeight : screenHeight;
      newVideoSizeWidth = videoWidth * newVideoSizeHeight / videoHeight;
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   // connectToSignalR();
  //   isLandscape = false;
  //   timeString = formatDateTime(DateTime.now());
  //   Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
  // }

  @override
  captureImage() async {
    try {
      OpenCameraControllerImpl cameraController = Get.find();
      CaptureImageControllerImp controller = Get.find();
      await controller.captureImage();
      cameraController.image = controller.imageFile;
      ModelControllerImpl modelController = Get.find();
      update();
      capturedImage = controller.imageFile;
      await Future.delayed(Duration(seconds: 1));
      result = modelController.result;
      accuracy = modelController.accuracy;
      print("===================================================$result");
      update();
       if (controller.imageFile!=null&& !modelController.isLoading) {
        result='';
        await modelController.doImageClassification(image: controller.imageFile!.path) ;
        update();
        capturedImage = controller.imageFile;
        await Future.delayed(Duration(seconds: 1));
        result = modelController.result;
        accuracy = modelController.accuracy;
        print("===================================================$result");
        update();

      }
    } catch (e) {
      print(e.toString());
    }




  }

}
