import 'package:flutter/material.dart';
class CustomGridViewItemContainer extends StatelessWidget {
  const CustomGridViewItemContainer({
    super.key, required this.index,
  });
  // final ProductModel product;
final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      height: MediaQuery.of(context).size.height * 0.03,
      width: MediaQuery.of(context).size.width * 0.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffF3F3F3),
      ),
    );
  }
}
