import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/app_routes.dart';

class FirebaseNotificationController extends GetxController {}

class FirebaseNotificationControllerImpl
    extends FirebaseNotificationController {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  List<RemoteMessage?> messages=[];
  int selectedIndex=0;
  requestPermission() async {
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
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<void> initNotification() async {
    await firebaseMessaging.requestPermission();
    String? token = await firebaseMessaging.getToken();
    print('==============================================================Token: $token');
    handleBackGroundNotification();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return ;
    }else{
      messages.add(message);
      update();
    Get.toNamed(AppRoutes.notificationsScreen, );}
  }
  removeItem(int index){
     selectedIndex=index;
    if(selectedIndex==index){
      messages.remove(messages[index]);
      update();

    }


  }


  Future handleBackGroundNotification() async {
   await FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    await FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  @override
  void onInit() {
    initNotification();
    requestPermission();

    super.onInit();
  }
}
