import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/core/constants/color.dart';
import '../../../data/models/onboardingmodel.dart';

class CustomSliderCommunityItem extends StatelessWidget {
  const CustomSliderCommunityItem({
    super.key,
    required this.item,
  });
  final OnBoardingModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.videosScreen, arguments: [item]);
        },
        child: Card(
          child: Container(
            color: AppColors.backgroundColor,
            
            child: ListTile(
          
              title: Text(item.title ?? ''),
              trailing: Image.asset('assets/images/Designer.jpeg'),
            ),
          ),
        ));
  }
}
