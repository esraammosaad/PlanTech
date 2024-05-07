import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/view/screens/language/choose_language.dart';


import 'package:grad_proj/core/constants/app_routes.dart';

import '../../../controller/home_controllers/profile_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
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
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              GetBuilder<ThemeController>(
                builder:(controller){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(Icons.dark_mode_outlined,color:AppColors.kPrimaryColor),
                        SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                        Text("Light Mode",style: Styles.textStyle18.copyWith(
                            color: controller.isDarkMode.value == true ? Colors.white:AppColors.kPrimaryColor),),
                      ],),
                      const ChangeMode(),

                    ],
                  );
                }),



              const CustomSpace(),

              CustomSettingItem(
                icon: Icons.language,
                title: "Language",
                onPressed: (){
                },
              ),
              const CustomSpace(),

              CustomSettingItem(
                icon: Icons.notifications,
                title: "Notifications",
                onPressed: (){},
              ),
              const CustomSpace(),
              CustomSettingItem(
                icon: Icons.info,
                title: "Info",
                onPressed: (){},
              ),
              const CustomSpace(),
              CustomSettingItem(
                icon: Icons.edit,
                title: "Edit Profile",
                onPressed: (){

                  Get.toNamed(AppRoutes.editProfileScreen);
                },
              ),
              const CustomSpace(),
              CustomSettingItem(
                icon: Icons.contact_phone,
                title: "Contact Us",
                onPressed: (){},
              ),
              const CustomSpace(),
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