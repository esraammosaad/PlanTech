import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grad_proj/view/screens/auth/signup_with_phone_number.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/icon_asset.dart';
class CustomSignUpMethods extends StatelessWidget {
  const CustomSignUpMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(AppIcons.googleIcon),
        Icon(
          Icons.facebook_outlined,
          size: 35,
          color: AppColors.faceBookColor,
        ),
        GestureDetector(
          onTap: (){
            Get.to(()=>const SignUpWithPhoneNumber());
          },
            child: Icon(Icons.phone, color: AppColors.textFormColor, size: 35)),
      ],
    );
  }
}