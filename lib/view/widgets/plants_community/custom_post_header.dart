import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../controller/community_controllers/plants_community_controller.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
import '../../../data/models/post_model.dart';
import '../home/custom_profile_avatar.dart';

class CustomPostHeader extends StatelessWidget {
  const CustomPostHeader({
    super.key,
    required this.headerData,
  });
  final PostModel headerData;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GetBuilder<PlantsCommunityControllerImp>(builder: (controller) {
      return Row(
        children: [
          SizedBox(
              width: getValueForScreenType(
                  context: context, mobile: 40, tablet: 90),
              height: getValueForScreenType(
                  context: context, mobile: 40, tablet: 90),
              child: CustomProfileAvatar(
                image: headerData.userImage == ''
                    ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'
                    : headerData.userImage ??
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
              )),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headerData.userName == null || headerData.userName == ''
                    ? "person"
                    : headerData.userName!,
                style: getValueForScreenType(
                    context: context,
                    mobile: Styles.textStyle14(context).copyWith(
                        fontWeight: FontWeight.w500,
                        color: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black),
                    tablet: Styles.textStyle25(context).copyWith(
                        fontWeight: FontWeight.w500,
                        color: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black)),
              ),
              SizedBox(height: getValueForScreenType(context: context, mobile: 0,tablet: 5),),
              Text(
                controller.updatePostTime(loadedTime: headerData.time!),
                style: getValueForScreenType(
                    context: context,
                    mobile: Styles.textStyle12(context)
                        .copyWith(color: AppColors.greyColor),
                    tablet: Styles.textStyle16(context)
                        .copyWith(color: AppColors.greyColor,fontWeight: FontWeight.bold)),
              ),

            ],
          )
        ],
      );
    });
  }
}
