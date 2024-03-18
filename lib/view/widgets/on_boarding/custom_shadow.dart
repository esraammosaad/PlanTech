import 'package:flutter/material.dart';
class CustomShadow extends StatelessWidget {
  const CustomShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black12, Colors.black38],
          )),
    );
  }
}