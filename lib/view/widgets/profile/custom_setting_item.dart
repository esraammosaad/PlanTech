import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/view/widgets/profile/change_mode.dart';

import '../../../core/class/them_controller.dart';

class CustomSettingItem extends StatelessWidget {
   const CustomSettingItem({
     super.key, required this.icon, required this.title, required this.onPressed,
    });

  final IconData icon ;
  final String title ;
  final VoidCallback onPressed ;

  @override
  Widget build(BuildContext context) {
    //ThemeController themeController = Get.put(ThemeController());
    return Column(
      children: [
        GetBuilder<ThemeController>(
          builder: (controller){
           // bool dark = controller.isDarkMode.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(icon,size: 24,color: AppColors.kPrimaryColor,),
                  const SizedBox(width: 8,),
                  Text(title,style: Styles.textStyle18.copyWith(
                      color: controller.isDarkMode.value == true ?  Colors.white : AppColors.kPrimaryColor),),
                ],),
                IconButton(onPressed: onPressed, icon:Icon(Icons.arrow_forward_ios,color: AppColors.kPrimaryColor,))
              ],
            );

          },

        ),
      ],
    );
  }
}
