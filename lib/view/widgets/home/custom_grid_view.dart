import 'package:flutter/material.dart';
import 'package:grad_proj/controller/plants_details_controllers/plants_details_controller.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:get/get.dart';
import '../../../controller/home_controllers/home_controller.dart';
import 'custom_grid_view_item.dart';
import 'custom_sliver_loading_indicator.dart';
import 'custom_sliver_try_again_text.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });
  static int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(right: 8,left: 8,top: 8,bottom: 30),
      sliver: GetBuilder<HomeControllerImp>(
        builder: (controller) => controller.errMessage != null
            ? CustomSliverTryAgainText(text: controller.errMessage!)
            : controller.isLoading
                ? const CustomSliverLoadingIndicator()
                : SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => GestureDetector(
                            onTap: () {
                              selectedIndex = index;

                              PlantsDetailsControllerImp
                                  plantsDetailsControllerImp = Get.find();
                              plantsDetailsControllerImp.getPlantsData(
                                  id: controller.dataList[index].id!);
                              Get.toNamed(AppRoutes.plantsDetailsScreen);
                            },
                            child: CustomGridViewItem(
                              item: controller.dataList[index],
                            )),
                        childCount: controller.dataList.length)),
      ),
    );
  }
}
