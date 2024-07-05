import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/controller/bluetooth/bluetooth_controller.dart';

class ConnectCamera extends StatelessWidget {
  final BluetoothControllerImp bluetoothService =
      Get.put(BluetoothControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  bluetoothService.connectionText.value,
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                bluetoothService.startScan();
              },
              child: Text('Start Scan'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                bluetoothService.disconnectFromDevice();
              },
              child: Text('Disconnect'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                bluetoothService.writeData("Your Data Here");
              },
              child: Text('Send Data'),
            ),
          ],
        ),
      ),
    );
  }
}

/*class ConnectCamera extends StatelessWidget {
  const ConnectCamera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Devices'),
      ),
      body: GetBuilder<BluetoothControllerImp>(
        init: BluetoothControllerImp(),
        builder: (BluetoothControllerImp controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<List<ScanResult>>(
                    stream: controller.scanResults,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final data = snapshot.data![index];
                                return Card(
                                  elevation: 2,
                                  child: ListTile(
                                    title: Text(data.device.name),
                                    subtitle: Text(data.device.id.id),
                                    trailing: Text(data.rssi.toString()),
                                    onTap: () =>
                                        controller.connectToDevice(data.device),
                                  ),
                                );
                              }),
                        );
                      } else {
                        return Center(
                          child: Text("No Device Found"),
                        );
                      }
                    }),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      controller.scanDevices();
                      // await controller.disconnectDevice();
                    },
                    child: Text("SCAN")),
              ],
            ),
          );
        },
      ));
      
}*/
