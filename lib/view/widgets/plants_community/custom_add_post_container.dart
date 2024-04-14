import 'package:flutter/material.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';

class CustomAddPostContainer extends StatelessWidget {
  const CustomAddPostContainer({
    super.key,
    required this.hintText,
  });
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
        border: Border.all(color: Colors.white54),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          hintText,
          style: Styles.textStyle16.copyWith(
              color: Colors.grey[400], fontFamily: AppFonts.kArabicFont),
        ),
      ),
    );
  }
}
