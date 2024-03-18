import 'package:flutter/material.dart';
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
    return  const Column(
      children: [
        CustomHomeAppBar(),
        CustomHomeSlider(),
        CustomPageIndicator(),
        SizedBox(height: 5,),
        CustomTextRow(),

      ],
    );
  }
}
