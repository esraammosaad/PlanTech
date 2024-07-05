import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/camera_controllers/camera_controller.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';  // Add this import

import 'package:signalr_netcore/hub_connection_builder.dart';

abstract class CaptureImageController extends GetxController {
  connectToSignalR();
  handleIncomingImage(List<Object?>? parameters);
  captureImage();
}

class CaptureImageControllerImp extends CaptureImageController {
  final serverUrl = "https://planethealth.azurewebsites.net/detection?type=flutter";
  late HubConnection hubConnection;
  Image? image;
  File? imageFile;
  bool isLoading = true;

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
      hubConnection.on("Take", handleIncomingImage);
      await hubConnection.start();

      debugPrint('Connection started');
      isLoading = false;
      update();
    } on Exception catch (e) {
      debugPrint('Connection error: ${e.toString()}');
      isLoading = false;
      update();
    }
  }

  @override
  void handleIncomingImage(List<dynamic>? parameters) async {
    try {
      if (parameters != null && parameters.isNotEmpty) {
        final base64String = parameters[0] as String?;
        if (base64String != null) {
          final imageBytes = base64Decode(base64String);

          // Use getApplicationDocumentsDirectory for writing files
          final directory = await getApplicationDocumentsDirectory();
          final filePath = '${directory.path}/image.jpg';
          final file = File(filePath);
          await file.writeAsBytes(imageBytes);

          debugPrint("Received image data with length: ${imageBytes.length}");
          image = Image.file(file);
          imageFile = file;
          update();
        } else {
          debugPrint("No valid image data received");
        }
      } else {
        debugPrint("No image data received");
      }
    } on Exception catch (e) {
      debugPrint('Error handling incoming image: ${e.toString()}');
    }
  }

  @override
  Future captureImage() async {
    try {
      await hubConnection.invoke("CaptureImage");
      debugPrint('Capture image invoked');
      isLoading = false;
      Fluttertoast.showToast(
        msg: "Image Saved in my garden",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      update();
    } on Exception catch (e) {
      debugPrint('Error capturing image: ${e.toString()}');
      isLoading = false;
      update();
    }
  }

  // @override
  // void onClose() {
  //   hubConnection.stop(); // Ensure the connection is stopped
  //   super.onClose();
  // }
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   // connectToSignalR();
  // }
}
