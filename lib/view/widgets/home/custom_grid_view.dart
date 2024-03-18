import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:get/get.dart';
import '../../../controller/home_controllers/home_controller.dart';
import 'custom_grid_view_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(5),
      sliver: GetBuilder<HomeControllerImp>(
        builder:(controller)=> controller.isLoading? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(color: AppColors.kPrimaryColor,))):SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
                (context, index) =>  CustomGridViewItem(index:index),
                childCount: controller.dataList.length)),
      ),
    );
  }
}
