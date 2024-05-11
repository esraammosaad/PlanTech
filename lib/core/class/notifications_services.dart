/*


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/data_source/remote/notification_repo/notification_repo.dart';


class NotificationServices extends StatefulWidget {
  const NotificationServices({super.key});

  @override
  State<NotificationServices> createState() => _NotificationServicesState();
}

class _NotificationServicesState extends State<NotificationServices> {
  getToken()async{
    String? mytoken = await FirebaseMessaging.instance.getToken();
    print("++++++++++++++++++++++++++++++++++++++++++++++++++");
    print(mytoken);
  }
  */
/*Future<void> requestPermition() async {
    PermissionStatus status = await Permission.notification.request();
    if( status != PermissionStatus.granted){
      throw Exception(("NOT!!"));
    }
  }*//*

  getPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void initState(){
    getToken();
    getPermission();
    // requestPermition();
    sendMessage("hi", "how are you");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("ddddddd"),
            onPressed: () async {
              await sendMessage("hi", "how are you");
            },
          ),
        ));
  }
}
*/
