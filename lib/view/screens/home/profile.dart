import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grad_proj/core/services/preferanceManager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';
import '../../widgets/home/custom_another_app_bar.dart';
import '../../widgets/profile/setting_options.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool status = false;
  ThemeController themeController = Get.put(ThemeController());
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
          status = PreferencesManager.instance.getBool('isDarkMode') ?? false;
          themeController.isDarkMode.value = status;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32.0,
      ),
      child: GetBuilder<ThemeController>(
        builder: (controller){
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
                child: CustomAnotherAppBar(text: 'Account Settings')),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(FirebaseAuth
                                    .instance.currentUser?.photoURL ??
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                alignment: AlignmentDirectional.centerStart,
                                fit: BoxFit.scaleDown,
                                child:
                                   // print('${themeController.isDarkMode.value}');
                                  Text(
                                      FirebaseAuth.instance.currentUser?.displayName==''||FirebaseAuth.instance.currentUser?.displayName==null?
                                      'person':FirebaseAuth.instance.currentUser!.displayName!,
                                      style: Styles.textStyle20.copyWith(
                                        color: controller.isDarkMode.value ? Colors.white : Colors.black
                                      ),
                                  )
                              ),
                              FittedBox(
                                alignment: AlignmentDirectional.centerStart,
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  FirebaseAuth.instance.currentUser?.email==''||FirebaseAuth.instance.currentUser?.email==null?
                                      'person':FirebaseAuth.instance.currentUser!.email!,
                                  style: Styles.textStyle14.copyWith(
                                      color: controller.isDarkMode.value ?Colors.grey[400] : Colors.grey[700],
                                      fontFamily: AppFonts.kArabicFont),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                    const SettingOptions()

                  ],
                ),
              ),
            ),
          ],
        );}
      ),
    );
  }
}



