import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../camera_controllers/camera_controller.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:uuid/uuid.dart';
import '../camera_controllers/model_controller.dart';

abstract class ImageStreamController extends GetxController {
  connectToSignalR();
  handleIncomingImage(List<Object?>? parameters);
  startImageStream(int interval);
  stopImageStream();
}

class ImageStreamControllerImp extends ImageStreamController {
  final serverUrl =
      "https://planethealth.azurewebsites.net/detection?type=flutter";
  late HubConnection hubConnection;
  Image? image;
  File? imageFile;
  List<Image> imageList = [];
  List<String?> resultList = [];
  List<double?> accuracyList = [];
  int chooseInterval = 0;
  bool isLoading = false;

  void pickInterval(int value) {
    chooseInterval = value;
    update();
  }

  List<File> imageFileList = [];

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

      hubConnection.on("Capture", handleIncomingImage);
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

  Future<void> handleIncomingImage(List? parameters) async {
    try {
      if (parameters != null && parameters.isNotEmpty) {
        final base64String = parameters[0] as String?;
        if (base64String != null) {
          final imageBytes = base64Decode(base64String);
          debugPrint("${parameters[0].toString()}");

          debugPrint("Received image data with length: ${imageBytes.length}");

          // Get the documents directory for storing files
          final directory = await getApplicationDocumentsDirectory();

          // Use UUID for a unique filename
          final uuid = Uuid();
          final uniqueFileName = '${uuid.v4()}.jpg';
          final filePath = '${directory.path}/$uniqueFileName';
          final file = File(filePath);
          await file.writeAsBytes(imageBytes);
          debugPrint("Saved image to: $filePath");
          image = Image.file(file);
          imageFile = file;
          OpenCameraControllerImpl cameraController = Get.find();
          cameraController.image = imageFile;
          ModelControllerImpl modelController = Get.find();
          update();
          await Future.delayed(Duration(seconds: 5));
          if (imageFile == null && modelController.isLoading) {
            resultList.add(modelController.result);
            accuracyList.add(modelController.accuracy);
            print(
                "===================================================$resultList");
            update();
            imageList.add(image!);
            imageFileList.add(file);
          }
          update();
          if (!imageFileList.contains(imageFile) &&
              !modelController.isLoading) {
            await modelController.doImageClassification(image: imageFile!.path);
            update();
            await Future.delayed(Duration(seconds: 5));
            if (!imageFileList.contains(imageFile)) {
              resultList.add(modelController.result);
              accuracyList.add(modelController.accuracy);
              print(
                  "===================================================$resultList");
              update();
              imageList.add(image!);
              imageFileList.add(file);
            }
            update();
            print(
                "===================================================$resultList");
            update();
          }
          update();
        } else {
          debugPrint("Invalid base64 string received");
        }
      } else {
        debugPrint("No image data received");
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void startImageStream(int interval) async {
    try {
      isLoading = true;

      await hubConnection.invoke("InitCapture", args: [interval]);
      debugPrint('Image stream started');
      isLoading = false;
      update();
    } on Exception catch (e) {
      debugPrint('Error starting image stream: ${e.toString()}');
      isLoading = false;
      update();
    }
  }

  void stopImageStream() async {
    try {
      await hubConnection.invoke("EndCapture");
      debugPrint('Image stream stopped');
      isLoading = false;
      update();
    } on Exception catch (e) {
      debugPrint('Error stopping image stream: ${e.toString()}');
      isLoading = false;
      update();
    }
  }
  //
  // @override
  // void onClose() {
  //   stopImageStream();
  //   hubConnection.stop(); // Ensure the connection is stopped
  //   super.onClose();
  // }
  //
  // @override
  // void onInit() {
  //   connectToSignalR();
  //   super.onInit();
  // }
}
