import 'package:flutter/material.dart';
import '../../../core/constants/styles.dart';
class CustomSnapTipsBadPhoto extends StatelessWidget {
  const CustomSnapTipsBadPhoto({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                image,
              ),
            ),
            const Positioned(
              top: -7,
              right: -7,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 15,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Styles.textStyle14.copyWith(height: 0),
        )
      ],
    );
  }
}
