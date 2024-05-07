import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
class CustomSearchMyGardenTextField extends StatelessWidget {
  const CustomSearchMyGardenTextField({Key? key, required this.onChanged, required this.controller}) : super(key: key);
  final void Function(String)? onChanged;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return TextField(
       onChanged: onChanged,
            controller:controller ,
            cursorColor: AppColors.kPrimaryColor,
            decoration: InputDecoration(
              contentPadding:  EdgeInsets.all(getValueForScreenType(context: context, mobile: 10,tablet: 25)),
              border: buildOutlineInputBorder(),
              disabledBorder: buildOutlineInputBorder(),
              enabledBorder: buildOutlineInputBorder(),
              errorBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              focusedErrorBorder: buildOutlineInputBorder(),
              hintText: 'Search plants',
              hintStyle: Styles.textStyle16(context).copyWith(color: AppColors.kGreyColor),
              prefixIcon:  Padding(
                padding:  EdgeInsets.only(left: getValueForScreenType(context: context, mobile: 20.0,tablet: 8)),
                child: Icon(Icons.search,color: AppColors.kGreyColor,size: getValueForScreenType(context: context, mobile: 24,tablet: 40),),
              ),
            ),
          );

  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide(color: AppColors.kPrimaryColor));
  }
}
