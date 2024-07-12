import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:rxdart/rxdart.dart';

abstract class BluetoothController extends GetxController {}

class BluetoothControllerImp extends BluetoothController {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  late String connectionText = '';
  bool isLoading=false;
  Future<bool> get bluetoothState => enabled();

  Future<bool> enabled() async {
    return await flutterBlue.isOn;
  }

  late StreamSubscription scanSubscription;
  String targetDeviceName = ' CropCare';
  BluetoothCharacteristic? targetCharacteristic;
  late BluetoothDevice _targetDevice;
  BluetoothDevice get targetDevice => _targetDevice;
  bool isDone = true;
  Stream streamScreen =
  ValueConnectableStream(FlutterBlue.instance.state).autoConnect();
  String uuid = "0000ffe0-0000-1000-8000-00805f9b34fb";
  String writeUuid = "0000ffe1-0000-1000-8000-00805f9b34fb";

  startScan() {
    isLoading=true;
    connectionText = "Start Scanning";
    debugPrint(connectionText);

    scanSubscription = flutterBlue.scan(timeout: const Duration(seconds: 5)).listen((scanResult) {
      debugPrint('Device found: ${scanResult.device.name}, UUID: ${scanResult.device.id}');

      if (scanResult.device.name == targetDeviceName) {
        isLoading=false;
        stopScan();
        connectionText = "Found Target Device";
        debugPrint(connectionText);
        _targetDevice = scanResult.device;
        update();
        connectToDevice();
      }
    }, onDone: () {
      isDone = false;
      debugPrint('Scan is done $isDone');
      stopScan();
      update();
    }, onError: (error) {
      debugPrint('Scan error: $error');
    });
    update();
  }

  stopScan() {
    scanSubscription.cancel();
    flutterBlue.stopScan();
    connectionText = "Scan stopped";
    update();

    debugPrint("Scan stopped");
  }

  connectToDevice() async {
    connectionText = "Device Connecting";
    debugPrint(connectionText);

    // Add a small delay here
    await Future.delayed(Duration(seconds: 1));

    try {
      await _targetDevice.connect();
      isDone = true;
      connectionText = "Device Connected";
      debugPrint(connectionText);
      discoverServices();
    } catch (e) {
      connectionText = "Failed to Connect: $e";
      debugPrint(connectionText);
      startScan();
    }
  }

  discoverServices() async {
    try {
      var services = await _targetDevice.discoverServices();
      for (var service in services) {
        if (service.uuid.toString() == uuid) {
          for (var characteristic in service.characteristics) {
            if (characteristic.uuid.toString() == writeUuid) {
              targetCharacteristic = characteristic;
              debugPrint("All Ready with ${targetDevice.name}");
            }
          }
        }
      }
    } catch (e) {
      debugPrint('Error discovering services: $e');
    }
  }
  disconnectFromDevice({required BluetoothDevice device}) async {
    try {
      await device.disconnect();
      connectionText = "Device Disconnected";
      debugPrint(connectionText);
      update();
    } catch (e) {
      debugPrint('Error disconnecting from device: $e');
    }
  }

  writeData(String data) async {
    if (targetCharacteristic == null) {
      debugPrint('Target characteristic is null. Cannot write data.');
      return;
    }
    // Proceed with writing data
    List<int> bytes = utf8.encode(data);
    debugPrint("Writing data: $data");
    try {
      await targetCharacteristic!.write(bytes, withoutResponse: false);
    } catch (e) {
      debugPrint('Error writing data: $e');
    }
  }


  requestPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (!status.isGranted) {
      await Permission.locationWhenInUse.request();
    }

    await Permission.bluetooth.request();
    await Permission.bluetoothScan.request();
    await Permission.bluetoothConnect.request();

    if (!await Permission.bluetooth.isGranted) {
      debugPrint('Bluetooth permission denied');
      return;
    }

    await startScan();
  }

  @override
  void onInit() {
    requestPermission();
    super.onInit();
  }
}
//        imageFile = file;
//           OpenCameraControllerImpl cameraController = Get.find();
//           await cameraController.pickPhotoFromGallery();
//           imageFile = cameraController.image;
//           cameraController.image = imageFile;
//           ModelControllerImpl modelController = Get.find();
//           update();
//           await Future.delayed(Duration(seconds: 5));
//           if(imageFile==null&&modelController.isLoading){
//           resultList.add(modelController.result);
//           accuracyList.add(modelController.accuracy);
//           print(
//               "===================================================$resultList");
//           update();
//           // imageList.add(image!);
//           imageFileList.add(imageFile!);}
//           update();
//
//           if (!imageFileList.contains(imageFile)  && !modelController.isLoading) {
//             await modelController.doImageClassification(image: imageFile!.path);
//             update();
//             await Future.delayed(Duration(seconds: 5));
//
//             print(
//                 "===================================================$resultList");
//             update();
//             // if(!imageList.contains(image)){
//             //
//             // imageList.add(image!);
//             // }
//
//             if (!imageFileList.contains(imageFile)) {
//               resultList.add(modelController.result);
//
//               accuracyList.add(modelController.accuracy);
//
//               imageFileList.add(imageFile!);
//             }
//             update();
//             print(
//                 "===================================================$resultList");
//             update();
//           }
//           update();
//           isLoading=false;