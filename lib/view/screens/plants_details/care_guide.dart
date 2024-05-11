import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/plants_details_controllers/care_guide_controller.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/core/shared/custom_loading_icon.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/fonts.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class CareGuide extends StatelessWidget {
  const CareGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      appBar: customAppBar(context,text: 'Care Guide'),
      body: GetBuilder<CareGuideControllerImp>(builder: (controller) {
        return controller.isLoading
            ? const CustomLoadingIcon(path: 'assets/icons/loading.json')
            : controller.errMessage != null
                ? Center(
                    child: Text(
                    controller.errMessage ?? '',
                    style: Styles.textStyle12
                        .copyWith(color: AppColors.kGreyColor),
                  ))
                : Obx(() {
                    return CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                          sliver: SliverToBoxAdapter(
                            child: FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  controller.careGuideData?.commonName ?? "",
                                  style: getValueForScreenType(context: context, mobile: Styles.textStyle20.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: themeController.isDarkMode.value
                                          ? AppColors.kPrimaryColor
                                          : Colors.black),tablet: Styles.textStyle30.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: themeController.isDarkMode.value
                                          ? AppColors.kPrimaryColor
                                          : Colors.black)),
                                )),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(5),
                          sliver: SliverList.builder(
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: ExpansionTile(
                                      title: Text(
                                        controller.careGuideData
                                                ?.section?[index]?.type ??
                                            '',
                                        style: getValueForScreenType(context: context, mobile: Styles.textStyle18.copyWith(
                                            fontFamily: AppFonts.kArabicFont,
                                            fontWeight: FontWeight.w500,color:
                                        themeController.isDarkMode.value
                                            ? Colors.white
                                            : Colors.black),tablet: Styles.textStyle25.copyWith(
                                            fontFamily: AppFonts.kArabicFont,
                                            fontWeight: FontWeight.w500,color:
                                        themeController.isDarkMode.value
                                            ? Colors.white
                                            : Colors.black)),
                                      ),
                                      backgroundColor:
                                          themeController.isDarkMode.value
                                              ? Colors.black26
                                              : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                          themeController.isDarkMode.value
                                              ? Colors.black26
                                              : AppColors.backgroundColor,
                                      childrenPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      collapsedIconColor:
                                          AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      initiallyExpanded: true,
                                      children: [
                                        Text(
                                          controller
                                                  .careGuideData
                                                  ?.section?[index]
                                                  ?.description ??
                                              '',
                                          style:getValueForScreenType(context: context, mobile: Styles.textStyle14.copyWith(
                                              color: AppColors.greyColor,
                                              fontFamily: AppFonts.kArabicFont,
                                              fontWeight: FontWeight.bold),tablet: Styles.textStyle20.copyWith(
                                              color: AppColors.greyColor,
                                              fontFamily: AppFonts.kArabicFont,
                                              fontWeight: FontWeight.bold)),
                                          textAlign: TextAlign.start,
                                        )
                                      ],
                                    ),
                                  ),
                              itemCount:
                                  controller.careGuideData?.section?.length),
                        ),

                        // const CustomSearchField(),
                      ],
                    );
                  });
      }),
    );
  }
}
