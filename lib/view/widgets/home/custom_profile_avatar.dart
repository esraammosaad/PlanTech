import 'package:flutter/material.dart';

class CustomProfileAvatar extends StatelessWidget {
  const CustomProfileAvatar({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}
