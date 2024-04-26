import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grad_proj/controller/plants_details_controllers/care_guide_controller.dart';
import 'package:grad_proj/controller/plants_details_controllers/plants_details_controller.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/view/widgets/home/custom_cached_network_image.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/constants/styles.dart';
import '../../widgets/home/custom_list_view_horizontal.dart';
import '../../widgets/home/custom_material_button.dart';
import '../../widgets/home/custom_plants_details_widgets.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class PlantsDetails extends StatelessWidget {
  const PlantsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller){
      return Scaffold(
        appBar: customAppBar(text: 'Details'),
        body: GetBuilder<PlantsDetailsControllerImp>(builder: (controller) {
          return controller.errMessage != null
              ? Center(child: Text(controller.errMessage!))
              : controller.isLoading
              ? Center(
            child: CircularProgressIndicator(
              color: AppColors.kPrimaryColor,
            ),
          )
              : CustomScrollView(
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
                  padding: const EdgeInsets.only(
                      right: 8.0, left: 8, top: 16, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<ThemeController>(
                        builder: (controller){
                          return Text(
                            "Origin :",
                            style: Styles.textStyle18
                                .copyWith(fontWeight: FontWeight.w600, color: controller.isDarkMode.value ? Colors.white : Colors.black),

                          );
                        },
                      ),
                    ],
                  ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
        }),
      );
    },
    );
  }
}
