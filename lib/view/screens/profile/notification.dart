import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/firebase_notification_controller.dart';
import 'package:grad_proj/core/constants/styles.dart';

import '../../../core/constants/color.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: customAppBar(context, text: 'Notifications'),
      body:
          GetBuilder<FirebaseNotificationControllerImpl>(builder: (controller) {
        return ListView.builder(
            itemCount: controller.messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                titleTextStyle: Styles.textStyle16(context),
                subtitleTextStyle: Styles.textStyle14(context),

                
                title: Text(controller.messages[index]?.notification?.title
                        .toString() ??
                    ""),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(controller
                          .messages[index]?.notification?.body
                          .toString() ??
                      ""),
                ),
                trailing:                   IconButton(onPressed: (){
                  controller.removeItem(index);
              
                }, icon: Icon(Icons.delete_outline,color: AppColors.kPrimaryColor,))
                ,
              );
            });
      }),
    );
  }
}
