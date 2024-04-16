import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/view/widgets/home/custom_sliver_try_again_text.dart';
import '../../../controller/home_controllers/see_all_controller.dart';
import '../../../controller/plants_details_controllers/plants_details_controller.dart';
import '../../../core/constants/app_routes.dart';
import '../../widgets/home/custom_grid_view_item.dart';
import '../../widgets/home/custom_sliver_loading_indicator.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class SeeAllPlants extends StatelessWidget {
  const SeeAllPlants({Key? key}) : super(key: key);
  static int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: 'All Plants'),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(5),
            sliver: GetBuilder<SeeAllControllerImp>(
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
                                        id: controller
                                            .seeAllDataList[index].id!);
                                    Get.toNamed(AppRoutes.plantsDetailsScreen);
                                  },
                                  child: CustomGridViewItem(
                                    item: controller.seeAllDataList[index],
                                  )),
                              childCount: controller.seeAllDataList.length)),
            ),
          ),

          // const CustomSearchField(),
        ],
      ),
    );
  }
}
