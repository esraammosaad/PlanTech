import 'package:flutter/material.dart';

import '../constants/styles.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 47,
        padding: const EdgeInsets.symmetric(horizontal: 92, vertical: 10),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(1.00, -0.03),
            end: Alignment(-1, 0.03),
            colors: [Color(0xFF75E00A), Color(0xFF09E09F)],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Center(
            child: Text(text,
                style: Styles.textStyle18.copyWith(color: Colors.black))),
      ),
    );
  }
}
