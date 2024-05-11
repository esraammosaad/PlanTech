import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_routes.dart';
import '../../screens/profile/my_profile.dart';
import '../../screens/profile/profile_settings.dart';
import 'custom_home_app_bar.dart';
import 'custom_home_slider.dart';
import 'custom_page_indicator.dart';
import 'custom_text_row.dart';

class CustomHomeWidgets extends StatelessWidget {
  const CustomHomeWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeAppBar(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Farm Models",
                style: TextStyle(
                  fontFamily: "Cooper Black",
                  fontSize: 25,
                  color: Color(0xff98A668),
                ),
              ),
              // main and final processes of farms===================
              const CustomHomeSlider(),
              const CustomPageIndicator(),

              // SizedBox(
              //   height: 200,
              //   width: 400,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(25),
              //     child: Image.network(
              //       "https://th.bing.com/th/id/R.0a53d8c035461b90d020b4f308380b04?rik=4rHYl9zspCpy3w&riu=http%3a%2f%2fwww.senecafoods.com%2fsites%2fdefault%2ffiles%2fbanners%2ffarm_cornfield_0.jpg&ehk=rtlkAC7UD9BRKO%2f3frCJ2LBfS0QgZyJg7plQQxosm2I%3d&risl=&pid=ImgRaw&r=0",
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Last Updates",
                style: TextStyle(
                  fontFamily: "Cooper Black",
                  fontSize: 25,
                  color: Color(0xff98A668),
                ),
              ),
              // last pic for farm
              SizedBox(
                height: 200,
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    "https://th.bing.com/th/id/R.c0b5b083561edb02878958dd57de8cb8?rik=6hS3HxiWbwQdPg&riu=http%3a%2f%2fwww.finereport.com%2fen%2fwp-content%2fthemes%2fblogs%2fimages%2f2019042507A.png&ehk=rNSj1mm9zBf8olvD9X5tfgSE1YWrncc56nEfgKJn2e8%3d&risl=&pid=ImgRaw&r=0",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 5,
        ),
        CustomTextRow(
            onTap: () {
              Get.toNamed(AppRoutes.seeAllScreen);},
            text: 'Popular Plants'),

      ],
    );
  }
}
