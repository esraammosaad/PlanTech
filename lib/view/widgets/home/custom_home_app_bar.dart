import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/view/screens/profile/my_profile.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';
import 'custom_profile_avatar.dart';
import 'custom_search_icon.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/images/logo.png", height: 60),
        GestureDetector(
          onTap: () {
            print('===================');
            Get.toNamed(AppRoutes.myProfileScreen);
          },
          child: CustomProfileAvatar(
              image: FirebaseAuth.instance.currentUser?.photoURL ??
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
        ),
        // const SizedBox(
        //   width: 12,
        // ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       'Welcome Back!',
        //       style: Styles.textStyle14.copyWith(
        //           color: Colors.grey[600], fontFamily: AppFonts.kArabicFont),
        //     ),
        //     Text(
        //       FirebaseAuth.instance.currentUser?.displayName==''||FirebaseAuth.instance.currentUser?.displayName==null?
        //       'person':FirebaseAuth.instance.currentUser!.displayName!,
        //       style: Styles.textStyle14.copyWith(
        //           color: Colors.grey[950], fontFamily: AppFonts.kArabicFont),
        //     ),
        //   ],
        // ),
        // const Spacer(),
        // const CustomSearchIcon(),
      ],
    );
  }
}
