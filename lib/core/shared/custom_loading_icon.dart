import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingIcon extends StatelessWidget {
  const CustomLoadingIcon({
    super.key,
    required this.path,
  });
  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Lottie.asset(path, alignment: Alignment.center,)],
      ),
    );
  }
}
