import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
class CustomProfileAvatar extends StatelessWidget {
  const CustomProfileAvatar({
    super.key, required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: getValueForScreenType(context: context, mobile: 25,tablet: 50),
      backgroundImage: NetworkImage(image),
    );
  }
}