import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/camera_controllers/my_garden_controller.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/view/widgets/home/custom_sliver_try_again_text.dart';
import '../../widgets/camera/custom_search_my_garden_text_field.dart';
import '../../widgets/home/custom_another_app_bar.dart';
import 'custom_my_garden_list_item.dart';



class MyGarden extends StatelessWidget {
  const MyGarden({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0,),
          child: CustomScrollView(
            slivers: [
               SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CustomAnotherAppBar(text: 'My Garden'),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                      child: GetBuilder<MyGardenControllerImp>(
                        builder: (controller) {
                          return Column(
                            children: [
                              CustomSearchMyGardenTextField(onChanged: (value){
                                controller.searchInMyGarden(data: controller.myGarden!,text:value);
                              },controller: controller.controller,),
                            ],
                          );
                        }
                      ),
                    )
                  ],
                ),
              ),
              GetBuilder<MyGardenControllerImp>(builder: (controller) {
                return controller.isLoading
                    ? SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      )
                    : controller.myGarden!.isEmpty
                        ? const CustomSliverTryAgainText(text: 'You Garden Is Empty!')
                        : SliverList.builder(
                            itemBuilder: (context, index) =>
                                GestureDetector(onTap :(){
                                  Get.toNamed(AppRoutes.gardenItemDetailsScreen,arguments: [index]);

                                },child: CustomMyGardenListItem(index: index)),
                            itemCount: controller.myGarden?.length,
                          );
              }),
              const SliverToBoxAdapter(child: SizedBox(height: 10,),)
            ],
          ),
        ),
      ),
    );
  }

}


