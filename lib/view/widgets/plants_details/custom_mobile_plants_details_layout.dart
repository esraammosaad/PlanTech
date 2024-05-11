import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/plants_details_controllers/care_guide_controller.dart';
import '../../../controller/plants_details_controllers/plants_details_controller.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/constants/color.dart';
import '../home/custom_cached_network_image.dart';
import '../home/custom_list_view_horizontal.dart';
import '../home/custom_material_button.dart';
import '../home/custom_plants_details_widgets.dart';
class CustomMobilePlantsDetailsLayOut extends StatelessWidget {
  const CustomMobilePlantsDetailsLayOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlantsDetailsControllerImp>(
        builder: (controller) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomCachedNetworkImage(
                        image: controller
                            .plantsData?.defaultImage?.mediumUrl,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomPlantsDetailsWidgets(
                        plantData: controller.plantsData),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomListViewHorizontal(
                      originList: controller.plantsData?.origin ?? []),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 12,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
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
                              await careGuideController.getCareGuideData(
                                  url: controller
                                      .plantsData?.careGuides ??
                                      '');
                              Get.toNamed(AppRoutes.careGuideScreen);

                            });
                      }),
                ),
              ),
            ],
          );
        }
    );
  }
}
