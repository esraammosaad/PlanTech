import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/image_asset.dart';
class CustomSnapTipsGoodPhoto extends StatelessWidget {
  const CustomSnapTipsGoodPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        CircleAvatar(
          radius: getValueForScreenType(context: context, mobile: 65,tablet: 150),
          backgroundImage: const AssetImage(
            AppImageAsset.snapTipsOne,
          ),
        ),
         Positioned(
          top: -8,
          right: -8,
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: getValueForScreenType(context: context, mobile: 22,tablet: 45),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: getValueForScreenType(context: context, mobile: 35,tablet: 57),
            ),
          ),
        ),
      ],
    );
  }
}
