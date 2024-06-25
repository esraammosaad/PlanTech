import 'dart:async';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grad_proj/controller/bluetooth/bluetooth_controller.dart';

class ConnectCamera extends StatelessWidget {
  const ConnectCamera({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        width: double.infinity,
        child: GetBuilder<BluetoothControllerImp>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.isLoading
                  ? const CircularProgressIndicator()
                  : Text(controller.devices.isEmpty
                      ? 'No devices'
                      : controller.devices[2].name.toString()),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await controller.connect(controller.address);
                  },
                  child: const Text('connect')),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await controller.sendData('right');
                  },
                  child: const Text('right')),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await controller.sendData('left');
                  },
                  child: const Text('left')),
              const SizedBox(
                height: 30,
              ),
            ],
          );
        }),
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
