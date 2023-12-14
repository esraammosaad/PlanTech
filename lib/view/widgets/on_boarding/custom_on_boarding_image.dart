import 'package:flutter/material.dart';

import '../../../data/data_source/static/static.dart';
class CustomOnBoardingImage extends StatelessWidget {
  const CustomOnBoardingImage({
    super.key, required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                onBoardigList[index].image!,
              ),
              fit: BoxFit.fill)),
    );
  }
}