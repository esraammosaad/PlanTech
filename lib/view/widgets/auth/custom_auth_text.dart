import 'package:flutter/material.dart';
import '../../../core/constants/styles.dart';
class CustomAuthText extends StatelessWidget {
  const CustomAuthText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.textStyle17,
    );
  }
}
