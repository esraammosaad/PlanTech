import 'package:flutter/material.dart';
import 'package:grad_proj/controller/home_controllers/nav_bar_controller.dart';
import 'package:get/get.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
class CustomAnotherAppBar extends StatelessWidget {
  const CustomAnotherAppBar({
    super.key, required this.text,
  });
  final String text;


  @override
  Widget build(BuildContext context) {
    NavBarControllerImp controller = Get.find();
    return Row(
      children: [

        IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            color: AppColors.kPrimaryColor,
          ),
          onPressed: () {
            controller.pageController
                .jumpToPage(controller.selectedPage - 1);
            FocusScope.of(context).unfocus();

          },
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Styles.textStyle18,
        ),
      ],
    );
  }
}
