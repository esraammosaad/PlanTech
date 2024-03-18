import 'package:flutter/material.dart';
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
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 0.6),
        ),
        child: Center(
          child: IconButton(
            onPressed: () {
              controller.nextPage();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}