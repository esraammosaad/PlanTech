import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import '../../../core/constants/styles.dart';
class CustomGridViewItemFooter extends StatelessWidget {
  const CustomGridViewItemFooter({
    super.key, required this.productName,
  });
  final String productName;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=Get.find();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          productName,
          overflow: TextOverflow.ellipsis,
          style: Styles.textStyle16(context)
              .copyWith(color:themeController.isDarkMode.value?Colors.white: Colors.black,fontWeight: FontWeight.w400,),
        ),
      ),
    );
  }
}
