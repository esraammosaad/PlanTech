import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/camera_controllers/my_garden_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
class CustomSearchMyGardenTextField extends StatelessWidget {
  const CustomSearchMyGardenTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyGardenControllerImp>(
        builder: (controller) {
          return TextField(
            onChanged: (value){
              controller.searchInMyGarden(data: controller.myGarden!,text:value);
            },
            controller:controller.controller ,
            cursorColor: AppColors.kPrimaryColor,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border: buildOutlineInputBorder(),
              disabledBorder: buildOutlineInputBorder(),
              enabledBorder: buildOutlineInputBorder(),
              errorBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              focusedErrorBorder: buildOutlineInputBorder(),
              hintText: 'Search plants',
              hintStyle: Styles.textStyle16.copyWith(color: AppColors.kGreyColor),
              prefixIcon:  Icon(Icons.search,color: AppColors.kGreyColor,),
            ),
          );
        }
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide(color: AppColors.kPrimaryColor));
  }
}
