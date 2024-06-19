import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';

class ConnectCamera extends StatefulWidget {
  const ConnectCamera({super.key});

  @override
  State<ConnectCamera> createState() => _ConnectCamera();
}

class _ConnectCamera extends State<ConnectCamera> {
  List<BluetoothDevice> _devices = [];
  late BluetoothConnection connection;
  String address = '00:21:07:00:50:69';
  bool isLoading = true;
  void _requestPermission() async {
    await Permission.location.request();
    await Permission.bluetooth.request();
    await Permission.bluetoothScan.request();
    await Permission.bluetoothConnect.request();

  }

  @override
  void initState() {
     _requestPermission();
    super.initState();
    loadDevices();

  }

  Future<void> loadDevices() async {
    List<BluetoothDevice> devices =
        await FlutterBluetoothSerial.instance.getBondedDevices();
    setState(() {
      _devices = devices;
    });
    isLoading=false;
  }

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
      debugPrint(e.toString());
    }
  }

  Future connect(String address) async {
    try {
      connection = await BluetoothConnection.toAddress(address);
      sendData('111');
      connection.input!.listen((Uint8List data) {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            isLoading?const CircularProgressIndicator():Text(_devices.isEmpty?'No devices':_devices[0].name.toString()),
            const SizedBox(height: 30,),

            ElevatedButton(
                onPressed: () async {
                  await connect(address);
                },
                child: const Text('connect')),
            const SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () async {
                  await sendData('right');
                },
                child: const Text('right')),
            const SizedBox(height: 30,), ElevatedButton(
                onPressed: () async {
                  await sendData('left');
                },
                child: const Text('left')),
            const SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:video_player/video_player.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late VideoPlayerController _controller;
//   String _streamUrl = 'http://your_raspberry_pi_ip:port/stream'; // Replace with your RTSP stream URL
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(_streamUrl);
//     _loadVideo();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Future<void> _loadVideo() async {
//     // Check if stream URL is valid before initializing the player
//     var response = await http.get(Uri.parse(_streamUrl));
//     if (response.statusCode == 200) {
//       await _controller.initialize();
//       setState(() {});
//     } else {
//       print('Error fetching stream: ${response.statusCode}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: _controller.value.initialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : CircularProgressIndicator(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying ? _controller.pause() : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }
// }