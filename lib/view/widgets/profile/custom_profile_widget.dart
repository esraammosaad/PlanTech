import 'package:flutter/material.dart';

class CustomProfileWidget extends StatelessWidget {
  const CustomProfileWidget({
    super.key,
    required this.onTap,
    required this.text,
  });
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(text),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          const Divider(
            height: 0,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
