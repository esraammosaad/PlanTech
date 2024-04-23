import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/functions/awesome_dialog.dart';
import '../../../core/constants/styles.dart';

class CustomDropdownIcon extends StatelessWidget {
  const CustomDropdownIcon({
    super.key,
    required this.editOnTap, required this.deleteOnTap,
  });

  final VoidCallback editOnTap;
  final VoidCallback deleteOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonHideUnderline(

          child: DropdownButton2(

        dropdownStyleData: const DropdownStyleData(

          width: 100,
        ),
        onChanged: (value) {},


        customButton: const Icon(
          Icons.more_horiz_rounded,
          size: 24,
          color: Colors.black,
        ),

        items: [
          DropdownMenuItem(
            enabled: false,



            value: 'Edit',
            child: GestureDetector(
                onTap:editOnTap ,
                child: Text(
                  'Edit',
                  style: Styles.textStyle10,
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
                  style: Styles.textStyle10,
                )),
          )
        ],
      )),
    );
  }
}
