import 'package:flutter/material.dart';
import '../../../core/constants/styles.dart';
class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popular Plants',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'See All',
          style: Styles.textStyle16.copyWith(
              color: Colors.grey,
              textBaseline: TextBaseline.alphabetic),
        ),
      ],
    );
  }
}
