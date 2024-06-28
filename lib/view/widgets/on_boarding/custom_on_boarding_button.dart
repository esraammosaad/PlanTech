import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/color.dart';
import '../../../controller/on_boarding_controller.dart';

class CustomOnBoardingButton extends StatelessWidget {
  const CustomOnBoardingButton({
    super.key,
    required this.controller,
  });

  final OnBoardingController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: IconButton(
            onPressed: () {
              controller.nextPage();
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
