import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../core/class/them_controller.dart';
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
      children: [
        CustomProfileAvatar(
            image: FirebaseAuth.instance.currentUser?.photoURL ??
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: Styles.textStyle14.copyWith(
                  color: Colors.grey[600], fontFamily: AppFonts.kArabicFont),
            ),
            GetBuilder<ThemeController>(
              builder: (controller){
                return Text(
                  FirebaseAuth.instance.currentUser?.displayName==''||FirebaseAuth.instance.currentUser?.displayName==null?
                  'person':FirebaseAuth.instance.currentUser!.displayName!,
                  style: Styles.textStyle16.copyWith(
                      color:  controller.isDarkMode.value ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,fontFamily: AppFonts.kArabicFont),
                );
              },

            ),
            /*Text(
              FirebaseAuth.instance.currentUser?.displayName==''||FirebaseAuth.instance.currentUser?.displayName==null?
              'person':FirebaseAuth.instance.currentUser!.displayName!,
              style: Styles.textStyle14.copyWith(
                  color: Colors.grey[950], fontFamily: AppFonts.kArabicFont),
            ),*/
          ],
        ),
        const Spacer(),
        const CustomSearchIcon(),
      ],
    );
  }
}
