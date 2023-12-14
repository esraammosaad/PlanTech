import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/on_boarding_controller.dart';
import 'package:grad_proj/core/constants/styles.dart';
import '../../../core/shared/custom_button.dart';
import '../../../data/data_source/static/static.dart';
import 'custom_on_boarding_circles.dart';
import 'custom_page_indicator.dart';
import 'custom_skip_button.dart';

class CustomOnBoardingDecoration extends GetView<OnBoardingController> {
  const CustomOnBoardingDecoration({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.00, -1.00),
          end: const Alignment(0, 1),
          colors: [
            Colors.black.withOpacity(0),
            Colors.black.withOpacity(0.20000000298023224),
            Colors.black
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: const Align(
                alignment: AlignmentDirectional.topEnd,
                child: CustomSkipButton(),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                onBoardigList[index].title!,
                style: Styles.textStyle36,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              onBoardigList[index].body!,
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: CustomOnBoardingCircles(index: index),
            ),
            const Spacer(),
            CustomButton(text: 'Next', onTap: () {
              controller.nextPage();

            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const CustomPageIndicator(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}



