

import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/core/localization/change_local.dart';
import 'package:grad_proj/core/shared/custom_button.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_routes.dart';

class ChooseLanguage extends GetView<LocaleController> {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Language"),
      leading: IconButton(icon: Icon(Icons.arrow_back,color: AppColors.kPrimaryColor,),
      onPressed: Get.back,),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height:MediaQuery.of(context).size.height*0.13 ,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CustomButton(
                  text: '3'.tr,
                //  color: chossed== true? AppColors.kPrimaryColor : Colors.white ,
                  onTap: () {
                   // chossed = true ;
                    controller.changeLang('ar');
                  }),
              const SizedBox(
                height: 4,
              ),
              CustomButton(
               // color: chossed== false? AppColors.kPrimaryColor : Colors.white ,
                  text: '2'.tr,
                  onTap: () {
                 // chossed = false;
                    controller.changeLang('en');
                  }),

            ],
          ) ,
        ),
      ),
    );
  }
}
