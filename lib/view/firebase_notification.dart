import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../core/constants/app_routes.dart';

class FirebaseNotification {
final _firebaseMessaging = FirebaseMessaging.instance;

Future<void>initNotification() async {
  await _firebaseMessaging.requestPermission();
  String? token = await _firebaseMessaging.getToken();
  print('++++++++++++++++++++++++++++++++++++++++${token}');
}
void handlingMessage(RemoteMessage? message){
  if(message == null){
    return ;

  }

}
}