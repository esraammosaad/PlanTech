import 'package:flutter/material.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontFamily: "Cooper Black",
            fontSize: 25,
            color: Color(0xff98A668),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'See All',
            style: TextStyle(
              fontFamily: "Cooper Black",
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
