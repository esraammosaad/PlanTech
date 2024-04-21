import 'package:flutter/material.dart';

class CustomSpace extends StatelessWidget {
  const CustomSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SizedBox(height: 8,),
      Divider(
        height: 0,
        thickness: 1,
      ),
      SizedBox(height: 8,),
    ]
    );

  }
}
