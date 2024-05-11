/*

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';


  class NotificationService extends GetxController{
   getToken()async{
     String? mytoken = await FirebaseMessaging.instance.getToken();
     print("++++++++++++++++++++++++++++++++++++++++++++++++++");
     print(mytoken);
   }
   Future<void> requestPermition() async {
     PermissionStatus status = await Permission.notification.request();
     if( status != PermissionStatus.granted){
       throw Exception(("NOT!!"));
     }
   }
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


}*/
