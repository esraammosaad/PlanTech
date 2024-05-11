import 'dart:convert';

import 'package:dio/dio.dart';

sendMessage( tittle , message) async {
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'key=AAAAp_ZBWhc:APA91bHir5TQBEgx6k2l1zgnHl162IEXYpaFCyymLHmj9TWJkmeMbRc4IcfdpmNROEoGIPtRhB7n3Bq0bsS4mWOPuorssbwxtA0G9jTfo542NXBBOVqpaEtJ2f4FhlaQWndxhDYhFZE-'
  };
  var data = json.encode({
    "to": "d_wy_LdTTCOXzJPC018xpY:APA91bEiBcYvE6IypNk5QnJICofoUs4JHgTV2F_feSGRwQkVZOOsRnt_qY-KXSv0_k9RY50aVoWiKIJhsg5M-jDQKxC_wkhaPair86L51ebyePfEMZd0257iNZql9ZFrazO1GXYSDo9K",
    "notification": {
      "title": "Check this Mobile ${tittle}",
      "body": "Rich Notification testing ${message}",
      "mutable_content": true,
      "sound": "Tri-tone"
    },
    "data": {
      "url": "<url of media image>",
      "dl": "<deeplink action on tap of notification>"
    }
  });
  var dio = Dio();
  var response = await dio.request(
    'https://fcm.googleapis.com/fcm/send',
    options: Options(
      method: 'POST',
      headers: headers,
    ),
    data: data,
  );

  if (response.statusCode == 200) {
    print(json.encode(response.data));
  }
  else {
    print(response.statusMessage);
  }
}