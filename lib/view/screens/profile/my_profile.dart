import 'package:flutter/material.dart';
import 'package:grad_proj/view/widgets/home/custom_third_app_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../widgets/profile/custom_my_profile_add_post_field.dart';
import '../../widgets/profile/custom_my_profile_stack.dart';
import '../../widgets/profile/custom_sliver_my_profile_list.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: customAppBar(context, text: 'My Profile'),
      body:  SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomMyProfileStack(),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(left: getValueForScreenType(context: context, mobile: 8,tablet: 25), right: getValueForScreenType(context: context, mobile: 8,tablet: 25), top: getValueForScreenType(context: context, mobile: 60,tablet: 110),bottom: getValueForScreenType(context: context, mobile: 0,tablet: 10)),
                  sliver:
                      const SliverToBoxAdapter(child: CustomMyProfileAddPostField()),
                ),
                const SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    sliver: CustomSliverMyProfileList()),
              ],
            )),
      ),
    );
  }
}



