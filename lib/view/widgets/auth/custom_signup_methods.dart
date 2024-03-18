import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/icon_asset.dart';

class CustomSignUpMethods extends StatelessWidget {
  const CustomSignUpMethods({
    super.key,
    required this.onTapPhone, required this.onTapGoogle, required this.onTapFaceBook,
  });
  final VoidCallback onTapPhone;
  final VoidCallback onTapGoogle;
  final VoidCallback onTapFaceBook;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: onTapGoogle,
            child: SvgPicture.asset(AppIcons.googleIcon,height: 35,)),
        GestureDetector(
          onTap: onTapFaceBook,
          child: Icon(
            Icons.facebook_outlined,
            size: 35,
            color: AppColors.faceBookColor,
          ),
        ),
        GestureDetector(
            onTap: onTapPhone,
            child: Icon(Icons.phone, color: AppColors.kPrimaryColor, size: 34)),
      ],
    );
  }
}
