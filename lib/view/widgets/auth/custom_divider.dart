import 'package:flutter/material.dart';
class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
      ),
    );
  }
}