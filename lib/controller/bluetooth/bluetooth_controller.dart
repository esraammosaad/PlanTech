import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothControllerImp extends GetxController {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  var connectionText = "Not connected".obs;
  var isDone = true.obs;

  late StreamSubscription scanSubscription;
  String targetDeviceName = 'BT05'; //Change Name Here
  late BluetoothCharacteristic? targetCharacteristic;
  late BluetoothDevice _targetDevice;

  Future<bool> get bluetoothState => enabled();

  Future<bool> enabled() async {
    return await flutterBlue.isOn;
  }

  Future<void> startScan() async {
    connectionText.value = "Start Scanning";
    print('start----------------------------------');
    print(connectionText.value);

    scanSubscription =
        flutterBlue.scan(timeout: Duration(seconds: 4)).listen((scanResult) {
      print(scanResult);
      if (scanResult.device.name == targetDeviceName) {
        stopScan();
        connectionText.value = "Found Target Device";
        print(connectionText.value);
        _targetDevice = scanResult.device;
        update();
        connectToDevice();
      }
    }, onDone: () {
      isDone.value = false;
      print('is done $isDone');
      stopScan();
      update();
    });
    update();
  }

  void stopScan() {
    scanSubscription.cancel();
    flutterBlue.stopScan();
    print("stopped");
  }

  Future<void> connectToDevice() async {
    connectionText.value = "Device Connecting";
    print(connectionText.value);

    await _targetDevice.connect();
    isDone.value = true;
    connectionText.value = "Device Connected";
    print(connectionText.value);
    discoverServices();
  }

  String uuid = "0000ffe0-0000-1000-8000-00805f9b34fb";
  String writeUuid = "0000ffe1-0000-1000-8000-00805f9b34fb";

  Future<void> discoverServices() async {
    var services = await _targetDevice.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == uuid) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == writeUuid) {
            targetCharacteristic = characteristic;
            print("All Ready with ${_targetDevice.name}");
          }
        });
      }
    });
  }

  Future<void> readData() async {
    targetCharacteristic!.value.listen(null).onData((data) {
      String msg1 = utf8.decode(data);
      print("here is the $msg1");
    });
    List<int> decode = await targetCharacteristic!.read();
    String msg = utf8.decode(decode);
    print(msg);
  }

  Future<void> disconnectFromDevice() async {
    await _targetDevice.disconnect();
    connectionText.value = "Device Disconnected";
    print(connectionText.value);
    update();
  }

  Future<void> writeData(String data) async {
    if (targetCharacteristic == null) return;
    List<int> bytes = utf8.encode(data);
    print("bytes received");
    await targetCharacteristic!.write(bytes, withoutResponse: false);
  }
}
/*
class BluetoothControllerImp extends GetxController {
  FlutterBlue ble = FlutterBlue.instance;

// This Function will help users to scan near by BLE devices and get the list of Bluetooth devices.
  Future scanDevices() async {
    if (await Permission.bluetoothScan.request().isGranted) {
      if (await Permission.bluetoothConnect.request().isGranted) {
        ble.startScan(timeout: Duration(seconds: 15));

        ble.stopScan();
      }
    }
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device?.connect(timeout: Duration(seconds: 15));

    device?.state.listen((isConnected) {
      if (isConnected == BluetoothDeviceState.connecting) {
        print("Device connecting to: ${device.name}");
      } else if (isConnected == BluetoothDeviceState.connected) {
        print("Device connected: ${device.name}");
      } else {
        print("Device Disconnected");
      }
    });
  }

  Stream<List<ScanResult>> get scanResults => ble.scanResults;
}
*/
/*
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
  }*/

//   import 'dart:convert';
//   import 'package:flutter/material.dart';
//   import 'package:flutter/services.dart';
//   import 'package:flutter_blue_plus/flutter_blue_plus.dart';
//   import 'package:get/get.dart';
//   import 'package:permission_handler/permission_handler.dart';
//
//
//   abstract class BluetoothController extends GetxController {
//
//   }
//
//   class BluetoothControllerImp extends BluetoothController {
//     final List<BluetoothDevice> devicesList = <BluetoothDevice>[];
//     final Map<Guid, List<int>> readValues = <Guid, List<int>>{};
//     BluetoothDevice? connectedDevice;
//     List<BluetoothService> services = [];
//     final writeController = TextEditingController();
//
//
//     // Add device to list if not already present
//     addDeviceToList(BluetoothDevice device) {
//       if (!devicesList.any((element) => element.id == device.id)) {
//         devicesList.add(device);
//         update();
//       }
//     }
// // Initialize Bluetooth and start scanning for devices
//     initBluetooth() async {
//       await Permission.location.request();
//       await Permission.bluetooth.request();
//       await Permission.bluetoothScan.request();
//       await Permission.bluetoothConnect.request();
//
//       var subscription = FlutterBluePlus.onScanResults.listen((results) {
//         for (ScanResult result in results) {
//           addDeviceToList(result.device);
//         }
//       });
//
//       await FlutterBluePlus.startScan();
//       await FlutterBluePlus.isScanning.where((val) => val == false).first;
//       FlutterBluePlus.cancelWhenScanComplete(subscription);
//
//       await FlutterBluePlus.adapterState
//           .where((val) => val == BluetoothAdapterState.on)
//           .first;
//
//       FlutterBluePlus.connectedDevices.forEach((device) {
//         addDeviceToList(device);
//       });
//     }
//
//
//     requestPermission() async {
//       await Permission.location.request();
//
//       await Permission.bluetooth.request();
//       await Permission.bluetoothScan.request();
//       print(await Permission.bluetooth.status);
//
//       await Permission.bluetoothConnect.request();
//
//       if (!await Permission.bluetooth.isGranted) {
//         print('Bluetooth permission denied');
//         return;
//       }
//
//       await initBluetooth();
//     }
//
//
//     @override
//     void onInit() {
//       requestPermission();
//
//       super.onInit();
//     }
//     ListView buildListViewOfDevices() {
//       return ListView.builder(
//         itemCount: devicesList.length,
//         itemBuilder: (context, index) {
//           BluetoothDevice device = devicesList[index];
//           return ListTile(
//             title: Text(device.name ?? 'Unknown Device'),
//             subtitle: Text(device.id.toString()),
//             onTap: () async {
//               FlutterBluePlus.stopScan();
//               try {
//                 await device.connect();
//                 services = await device.discoverServices();
//                 connectedDevice = device;
//                 update();
//               } on PlatformException catch (e) {
//                 if (e.code != 'already_connected') {
//                   print('Error connecting: $e');
//                 }
//               }
//             },
//           );
//         },
//       );
//     }
//
//
//     List<ButtonTheme> buildReadWriteNotifyButton(BluetoothCharacteristic characteristic,BuildContext context) {
//       List<ButtonTheme> buttons = <ButtonTheme>[];
//
//       if (characteristic.properties.read) {
//         buttons.add(
//           ButtonTheme(
//             minWidth: 10,
//             height: 20,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4),
//               child: TextButton(
//                 child: const Text('READ', style: TextStyle(color: Colors.black)),
//                 onPressed: () async {
//                   var sub = characteristic.lastValueStream.listen((value) {
//
//                     readValues[characteristic.uuid] = value;
//                     update();
//
//                   });
//                   await characteristic.read();
//                   sub.cancel();
//                 },
//               ),
//             ),
//           ),
//         );
//       }
//       if (characteristic.properties.write) {
//         buttons.add(
//           ButtonTheme(
//             minWidth: 10,
//             height: 20,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4),
//               child: ElevatedButton(
//                 child: const Text('WRITE', style: TextStyle(color: Colors.black)),
//                 onPressed: () async {
//                   await showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: const Text("Write"),
//                           content: Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: TextField(
//                                   controller: writeController,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           actions: <Widget>[
//                             TextButton(
//                               child: const Text("Send"),
//                               onPressed: () {
//                                 characteristic.write(utf8.encode(writeController.value.text));
//                                 Navigator.pop(context);
//                               },
//                             ),
//                             TextButton(
//                               child: const Text("Cancel"),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                             ),
//                           ],
//                         );
//                       });
//                 },
//               ),
//             ),
//           ),
//         );
//       }
//       if (characteristic.properties.notify) {
//         buttons.add(
//           ButtonTheme(
//             minWidth: 10,
//             height: 20,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4),
//               child: ElevatedButton(
//                 child: const Text('NOTIFY', style: TextStyle(color: Colors.black)),
//                 onPressed: () async {
//                   characteristic.lastValueStream.listen((value) {
//
//                     readValues[characteristic.uuid] = value;
//                     update();
//
//                   });
//                   await characteristic.setNotifyValue(true);
//                 },
//               ),
//             ),
//           ),
//         );
//       }
//
//       return buttons;
//     }
//
//     ListView buildConnectDeviceView(BuildContext context) {
//       List<Widget> containers = <Widget>[];
//
//       for (BluetoothService service in services) {
//         List<Widget> characteristicsWidget = <Widget>[];
//
//         for (BluetoothCharacteristic characteristic in service.characteristics) {
//           characteristicsWidget.add(
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       Text(characteristic.uuid.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   Row(
//                     children: <Widget>[
//                       ...buildReadWriteNotifyButton(characteristic,context),
//                     ],
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Expanded(child: Text('Value: ${readValues[characteristic.uuid]}')),
//                     ],
//                   ),
//                   const Divider(),
//                 ],
//               ),
//             ),
//           );
//         }
//         containers.add(
//           ExpansionTile(title: Text(service.uuid.toString()), children: characteristicsWidget),
//         );
//       }
//
//       return ListView(
//         padding: const EdgeInsets.all(8),
//         children: <Widget>[
//           ...containers,
//         ],
//       );
//     }
//
//     ListView buildView(BuildContext context) {
//       if (connectedDevice != null) {
//         return buildConnectDeviceView(context);
//       }
//       return buildListViewOfDevices();
//     }
//   }



