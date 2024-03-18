import 'package:flutter/material.dart';
import 'custom_text_field.dart';
class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 16),
            child: const CustomTextField(),
          ),
        ),
      ],
    );
  }
}
