import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/styles.dart';
class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    required this.text,
    required this.textTwo,
    required this.onTap,
  });
  final String text;
  final String textTwo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: text,
              style: Styles.textStyle14,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap=onTap,
              text: textTwo,
              style: Styles.textStyle16,
            ),
          ],
        ),
      ),
    );
  }
}
