import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/camera_controllers/my_garden_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/view/widgets/home/custom_sliver_try_again_text.dart';
import '../../widgets/camera/custom_search_my_garden_text_field.dart';
import '../../widgets/home/custom_another_app_bar.dart';
import 'custom_my_garden_list_item.dart';

class Bluetooth extends StatefulWidget {
  const Bluetooth({Key? key}) : super(key: key);

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    CustomAnotherAppBar(text: 'My Garden'),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                      child: Column(
                        children: [
                          CustomSearchMyGardenTextField(),
                        ],
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
                                CustomMyGardenListItem(index: index),
                            itemCount: controller.myGarden?.length,
                          );
              }),
            ],
          ),
        ),
      ),
    );
  }
}


