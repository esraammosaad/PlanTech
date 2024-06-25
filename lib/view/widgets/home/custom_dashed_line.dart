import 'package:flutter/material.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List<Widget>.generate(
          20,
              (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0,),
              child: Container(
                  height: 1,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color:Colors.grey[350],
                  )
              ),
            ),
          ),),
      ],
    );
  }
}
