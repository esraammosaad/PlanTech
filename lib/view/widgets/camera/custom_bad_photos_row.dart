import 'package:flutter/material.dart';
import '../../../core/constants/image_asset.dart';
import 'custom_snap_tips_bad_photo.dart';
class CustomBadPhotosRow extends StatelessWidget {
  const CustomBadPhotosRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSnapTipsBadPhoto(
            text: 'Too close', image: AppImageAsset.tooCloseSnap),
        SizedBox(
          width: 16,
        ),
        CustomSnapTipsBadPhoto(
          text: 'Too far',
          image: AppImageAsset.tooFarSnap,
        ),
        SizedBox(
          width: 16,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: CustomSnapTipsBadPhoto(
            text: 'Multiple\nSpecies',
            image: AppImageAsset.snapTipsTwo,
          ),
        ),
      ],
    );
  }
}
