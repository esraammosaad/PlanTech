import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import '../../../core/constants/styles.dart';
class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GetBuilder<ThemeController>(
          builder: (controller){
            return Text(
              text,
              style: Styles.textStyle18.copyWith(
                  color:  controller.isDarkMode.value ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            );
          },

        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'See All',
            style: Styles.textStyle16.copyWith(
                color: Colors.grey,
                textBaseline: TextBaseline.alphabetic),
          ),
        ),
      ],
    );
  }
}
