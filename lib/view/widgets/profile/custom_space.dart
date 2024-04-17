import 'package:flutter/material.dart';

class CustomSpace extends StatelessWidget {
  const CustomSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
      const Divider(
        height: 0,
        thickness: 1,
      ),
      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
    ]
    );

  }
}
