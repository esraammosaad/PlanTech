import 'package:flutter/material.dart';
class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.grey[500],
            size: 20,
          ),
          onPressed: () {}),
    );
  }
}
