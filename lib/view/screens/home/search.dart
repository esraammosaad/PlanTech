import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/home_controller.dart';
import 'package:grad_proj/core/shared/custom_loading_icon.dart';
import 'package:grad_proj/view/widgets/camera/custom_search_my_garden_text_field.dart';
import 'package:grad_proj/view/widgets/home/custom_grid_view_item.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../controller/plants_details_controllers/plants_details_controller.dart';
import '../../../core/constants/app_routes.dart';
import '../../widgets/home/custom_sliver_loading_indicator.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: 'Search', context),
      body: GetBuilder<HomeControllerImp>(builder: (controller) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
                  padding:  EdgeInsets.only(right: getValueForScreenType(context: context, mobile: 8,tablet: 110),left: getValueForScreenType(context: context, mobile: 8,tablet: 110),top: getValueForScreenType(context: context, mobile: 8,tablet: 50),bottom: getValueForScreenType(context: context, mobile: 8,tablet: 30)),
                  child: CustomSearchMyGardenTextField(
                                controller: controller.searchController,
                                onChanged: (value) {
                  controller.searchForPlants(text: value);
                                },
                              ),
                )),

            controller.searchResult.isEmpty
                ? const SliverFillRemaining(
              hasScrollBody: false,
                    child: Center(
                        child: CustomLoadingIcon(
                            path: 'assets/icons/search_animation.json',mobileSize: 150,tabletSize: 300,)))
                : controller.isLoading
                ? const CustomSliverLoadingIndicator()
                :SliverPadding(
              padding:  EdgeInsets.symmetric(horizontal: getValueForScreenType(context: context, mobile: 8,tablet: 30),vertical: 16),
                  sliver: SliverGrid(
                      gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getValueForScreenType(context: context, mobile: 2,tablet: 3),
                        mainAxisSpacing: getValueForScreenType(context: context, mobile: 10,tablet: 15),
                        crossAxisSpacing: getValueForScreenType(context: context, mobile: 10,tablet: 15),
                      ),
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => GestureDetector(
                              onTap: () {
                                // selectedIndex = index;

                                PlantsDetailsControllerImp
                                    plantsDetailsControllerImp = Get.find();
                                plantsDetailsControllerImp.getPlantsData(
                                    id: controller.searchResult[index].id!);
                                Get.toNamed(AppRoutes.plantsDetailsScreen);
                              },
                              child: CustomGridViewItem(
                                item: controller.searchResult[index],
                              )),
                          childCount: controller.searchResult.length)),
                )
          ],
        );
      }),
    );
  }
}
