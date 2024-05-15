import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/constants/app_routes.dart';
import 'custom_home_app_bar.dart';
import 'custom_home_slider.dart';
import 'custom_page_indicator.dart';
import 'custom_text_row.dart';
class CustomHomeWidgets extends StatelessWidget {
  const CustomHomeWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        const CustomHomeAppBar(),
        const CustomHomeSlider(),
        const CustomPageIndicator(),
        const SizedBox(height: 5,),
        CustomTextRow(onTap:(){
          Get.toNamed(AppRoutes.seeAllScreen);

        },text: 'Popular Plants'),

      ],
    );
  }
}
