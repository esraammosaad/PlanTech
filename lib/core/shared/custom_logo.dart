import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/fonts.dart';
import '../constants/styles.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Align(
            alignment: Alignment.topLeft,
            child: Container(
                height: 80,
                width: 180,
                child: Image.asset('assets/images/logo.png'))),
      ),
    );
  }
}
