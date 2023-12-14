import 'package:flutter/material.dart';

import '../../../core/constants/styles.dart';
class CustomSkipButton extends StatelessWidget {
  const CustomSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Text(
        'Skip',
        style: Styles.textStyle18,
      ),
    );
  }
}
