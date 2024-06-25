import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomLoadingIcon extends StatelessWidget {
  const CustomLoadingIcon({
    super.key,
    required this.path, this.mobileSize, this.tabletSize,
  });
  final String path;
  final double ?mobileSize;
  final double ?tabletSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            path,
            alignment: Alignment.center,
            height: getValueForScreenType(
                context: context, mobile: mobileSize, tablet: tabletSize),
            width: getValueForScreenType(
                context: context, mobile: mobileSize, tablet: tabletSize),
          )
        ],
      ),
    );
  }
}
