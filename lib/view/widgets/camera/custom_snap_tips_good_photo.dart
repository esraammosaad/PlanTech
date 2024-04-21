import 'package:flutter/material.dart';
import '../../../core/constants/image_asset.dart';
class CustomSnapTipsGoodPhoto extends StatelessWidget {
  const CustomSnapTipsGoodPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        CircleAvatar(
          radius: 65,
          backgroundImage: AssetImage(
            AppImageAsset.snapTipsOne,
          ),
        ),
        Positioned(
          top: -8,
          right: -8,
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: 22,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
