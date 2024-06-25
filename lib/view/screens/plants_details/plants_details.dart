import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/plants_details_controllers/plants_details_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/class/them_controller.dart';
import '../../widgets/home/custom_third_app_bar.dart';
import '../../widgets/plants_details/custom_mobile_plants_details_layout.dart';
import '../../widgets/plants_details/custom_tablet_plants_details_layout.dart';

class PlantsDetails extends StatelessWidget {
  const PlantsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();

    return Scaffold(
      appBar: customAppBar(context,text: 'Details'),
      body: GetBuilder<PlantsDetailsControllerImp>(builder: (controller) {
        return controller.errMessage != null
            ? Center(child: Text(controller.errMessage!))
            : controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.kPrimaryColor,
                    ),
                  )
                : ScreenTypeLayout.builder(
                  mobile:(context)=> const CustomMobilePlantsDetailsLayOut(),
          tablet:(context)=> CustomTabletPlantsDetailsLayOut(themeController: themeController),
                );
      }),
    );
  }
}


