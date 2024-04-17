import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/view/screens/language/choose_language.dart';

import '../../../controller/home_controllers/profile_controller.dart';
import '../../../core/constants/color.dart';
import 'change_mode.dart';
import 'custom_setting_item.dart';
import 'custom_space.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImpl>(builder: (controller) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(Icons.dark_mode_outlined,color:AppColors.kPrimaryColor),
                    SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                    Text("Light Mode",style: TextStyle(color: AppColors.kPrimaryColor),),
                  ],),
                  ChangeMode(),

                ],
              ),
              CustomSpace(),

              CustomSettingItem(
                icon: Icons.language,
                title: "Language",
                onPressed: (){
                  Get.to(ChooseLanguage());
                },
              ),
              CustomSpace(),

              CustomSettingItem(
                icon: Icons.notifications,
                title: "Notifications",
                onPressed: (){},
              ),
              CustomSpace(),
              CustomSettingItem(
                icon: Icons.info,
                title: "Info",
                onPressed: (){},
              ),
              CustomSpace(),
              CustomSettingItem(
                icon: Icons.edit,
                title: "Edit Profile",
                onPressed: (){},
              ),
              CustomSpace(),
              CustomSettingItem(
                icon: Icons.contact_phone,
                title: "Contact Us",
                onPressed: (){},
              ),
              CustomSpace(),
              CustomSettingItem(
                icon: Icons.logout,
                title: "Logout",
                onPressed: (){
                  controller.logOut();
                },
              ),




            ],
          ),
        ),
      );
    });
  }
}