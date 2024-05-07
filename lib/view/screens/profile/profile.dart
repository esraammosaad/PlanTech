import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/profile_controller.dart';
import '../../widgets/home/custom_another_app_bar.dart';
import '../../widgets/profile/custom_profile_bigger_avatar.dart';
import '../../widgets/profile/custom_profile_name_and_email.dart';
import '../../widgets/profile/setting_options.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 85
      ),
      child: GetBuilder<ProfileControllerImpl>(
        builder: (controller) {
          return const CustomScrollView(

            slivers: [
              SliverToBoxAdapter(
                  child: CustomAnotherAppBar(text: 'Account Settings')),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
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
                            flex: 4,
                            child: CustomProfileNameAndEmail(),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SettingOptions()
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}


