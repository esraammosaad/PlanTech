import 'package:flutter/material.dart';

import '../../../data/data_source/static/static_onboarding.dart';
class CustomOnBoardingImage extends StatelessWidget {
  const CustomOnBoardingImage({
    super.key, required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.5,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                onBoardingList[index].image!,
              ),
              fit: BoxFit.fill)),
    );
  }
}