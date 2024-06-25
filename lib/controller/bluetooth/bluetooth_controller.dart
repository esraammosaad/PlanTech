import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class BluetoothController extends GetxController {
  requestPermission();
  loadDevices();
  sendData(String data);
  connect(String address);
}

class BluetoothControllerImp extends BluetoothController {
  List<BluetoothDevice> devices = [];
  late BluetoothConnection connection;
  String address = '00:21:07:00:50:69';
  bool isLoading = true;

  @override
  Future<void> requestPermission() async {
    await Permission.location.request();

    await Permission.bluetooth.request();
    await Permission.bluetoothScan.request();
    print(await Permission.bluetooth.status);

    await Permission.bluetoothConnect.request();

    if (!await Permission.bluetooth.isGranted) {
      print('Bluetooth permission denied');
      return;
    }

    await loadDevices();
  }

  @override
  Future<void> loadDevices() async {
    try {
      List<BluetoothDevice> devices =
          await FlutterBluetoothSerial.instance.getBondedDevices();

      devices = devices;
      update();

      isLoading = false;
    } on Exception catch (e) {
      debugPrint('==========================================${e.toString()}');
    }
  }

  @override
  Future<void> sendData(String data) async {
    data = data.trim();
    try {
      List<int> list = data.codeUnits;
      Uint8List bytes = Uint8List.fromList(list);
      connection.output.add(bytes);
      await connection.output.allSent;
      if (kDebugMode) {
        debugPrint('Data sent successfully');
      }
    } catch (e) {
      debugPrint('==========================================${e.toString()}');
    }
  }

  @override
  Future connect(String address) async {
    // Some simplest connection :F
    try {
      connection = await BluetoothConnection.toAddress(address);
      print('Connected to the device');
      connection.input?.listen((Uint8List data) {
        print('Data incoming: ${ascii.decode(data)}');
        connection.output.add(data); // Sending data
        if (ascii.decode(data).contains('!')) {
          connection.finish(); // Closing connection
          print('Disconnecting by local host');
        }
      }).onDone(() {
        print('Disconnected by remote request');
      });
    } catch (exception) {
      print('Cannot connect, exception occurred');
    }
  }

  @override
  void onInit() {
    requestPermission();
    loadDevices();
    super.onInit();
  }
}
