import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/functions/awesome_dialog.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/styles.dart';

class CustomDropdownIcon extends StatelessWidget {
  const CustomDropdownIcon({
    super.key,
    required this.editOnTap,
    required this.deleteOnTap,
  });

  final VoidCallback editOnTap;
  final VoidCallback deleteOnTap;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonHideUnderline(
          child: DropdownButton2(
        dropdownStyleData:  DropdownStyleData(
          width: getValueForScreenType(context: context, mobile: 100,tablet: 200),

        ),
        onChanged: (value) {},
        customButton: Icon(
          Icons.more_horiz_rounded,
          size: getValueForScreenType(context: context, mobile: 24,tablet: 30),
          color:
              themeController.isDarkMode.value ? Colors.white70 : Colors.black,
        ),
        items: [
          DropdownMenuItem(
            enabled: false,
            value: 'Edit',
            child: GestureDetector(
                onTap: editOnTap,
                child: Text(
                  'Edit',
                  style: getValueForScreenType(context: context, mobile: Styles.textStyle10(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white70
                          : Colors.black),tablet: Styles.textStyle20(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white70
                          : Colors.black,fontWeight: FontWeight.bold)),
                )),
          ),
          DropdownMenuItem(
            enabled: false,
            value: 'Delete',
            child: GestureDetector(
                onTap: () {
                  showAwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      title: 'Do you want to delete? ',
                      desc: '',
                      okOnPress: deleteOnTap,
                      cancelOnPress: () {
                        Get.back();
                      });
                },
                child: Text(
                  'Delete',
                  style: getValueForScreenType(context: context, mobile: Styles.textStyle10(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white70
                          : Colors.black),tablet: Styles.textStyle20(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white70
                          : Colors.black,fontWeight: FontWeight.bold)),
                )),
          )
        ],
      )),
    );
  }
}
