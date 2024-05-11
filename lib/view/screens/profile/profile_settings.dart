import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/profile_controllers/edit_profile_controller.dart';
import '../../../core/constants/app_routes.dart';
import '../../widgets/home/custom_another_app_bar.dart';
import '../../widgets/profile/custom_profile_bigger_avatar.dart';
import '../../widgets/profile/custom_profile_name_and_email.dart';
import '../../widgets/profile/setting_options.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,

          ),
          child: GetBuilder<EditProfileControllerImpl>(
            builder: (controller) {
              return  CustomScrollView(

                slivers: [
                  const SliverToBoxAdapter(
                      child: CustomAnotherAppBar(text: 'Account Settings')),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              // Get.toNamed(AppRoutes.myProfileScreen);

                            },

                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: CustomProfileBiggerAvatar(),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: CustomProfileNameAndEmail(),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const SettingOptions(),
                          const SizedBox(
                            height: 65,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}


