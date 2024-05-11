import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/plants_details_controllers/care_guide_controller.dart';
import '../../../controller/plants_details_controllers/plants_details_controller.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
import '../home/custom_cached_network_image.dart';
import '../home/custom_list_view_horizontal.dart';
import '../home/custom_material_button.dart';
import '../home/custom_plants_details_widgets_tablet.dart';
import '../home/custom_tablet_description_plants_details.dart';

class CustomTabletPlantsDetailsLayOut extends StatelessWidget {
  const CustomTabletPlantsDetailsLayOut({
    super.key,
    required this.themeController,
  });

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlantsDetailsControllerImp>(builder: (controller) {
      return Row(
        children: [
          Expanded(
            flex: 3,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 10,
                        child: CustomCachedNetworkImage(
                          image: controller.plantsData?.defaultImage?.mediumUrl,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomPlantsDetailsWidgetsTablet(
                          plantData: controller.plantsData),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomFittedPlantsDetailsText(themeController: themeController,text: "Scientific Name :  ${controller.plantsData?.scientificName ?? ""}"),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomFittedPlantsDetailsText(themeController: themeController, text: "Other Name :  ${controller.plantsData?.otherName ?? ""}"),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomFittedPlantsDetailsText(themeController: themeController, text: controller.plantsData?.dimension ?? ""),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Origin :",
                          style: Styles.textStyle30(context).copyWith(
                              fontWeight: FontWeight.w300,
                              color: themeController.isDarkMode.value
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomListViewHorizontal(
                              originList: controller.plantsData?.origin ?? []),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: GetBuilder<CareGuideControllerImp>(
                              builder: (careGuideController) {
                            return careGuideController.isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  )
                                : CustomMaterialButton(
                                    text: 'Care Guides',
                                    onPressed: () async {
                                      await careGuideController
                                          .getCareGuideData(
                                              url: controller
                                                      .plantsData?.careGuides ??
                                                  '');
                                      Get.toNamed(AppRoutes.careGuideScreen);
                                    });
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTabletDescriptionPlantsDetails(
                          plantData: controller.plantsData),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class CustomFittedPlantsDetailsText extends StatelessWidget {
  const CustomFittedPlantsDetailsText({
    super.key,
    required this.themeController, required this.text,
  });

  final ThemeController themeController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FittedBox(
        alignment: AlignmentDirectional.centerStart,
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: Styles.textStyle20(context).copyWith(
            fontWeight: FontWeight.w300,
            color: themeController.isDarkMode.value
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
