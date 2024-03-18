import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/controller/home_controllers/home_controller.dart';
import 'package:get/get.dart';
import 'custom_grid_view_item_container.dart';
import 'custom_grid_view_item_footer.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.find();
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: const Color(0xffeff4f4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffeff4f4), width: 0.5),
      ),
      child: Column(
        children: [
          Expanded(
              child: CachedNetworkImage(
            fit: BoxFit.cover,
            width: double.infinity,
            imageUrl: controller.dataList[index].defaultImage.thumbnail??"",
            errorWidget: (context, url, error) => const Icon(Icons.error),

          )),
          CustomGridViewItemFooter(
            productName: controller.dataList[index].commonName ?? "",
          ),
          CustomGridViewItemContainer(index: index),
        ],
      ),
    );
  }
}
