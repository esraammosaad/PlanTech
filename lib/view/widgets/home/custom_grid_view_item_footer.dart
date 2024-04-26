import 'package:flutter/material.dart';
import '../../../core/constants/styles.dart';
class CustomGridViewItemFooter extends StatelessWidget {
  const CustomGridViewItemFooter({
    super.key, required this.productName,
  });
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          productName,
          overflow: TextOverflow.ellipsis,
          style: Styles.textStyle16
              .copyWith(color: Colors.black,fontWeight: FontWeight.bold,
          fontFamily: "ComingSoon"),
        ),
      ),
    );
  }
}
