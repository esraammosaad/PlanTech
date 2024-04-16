import 'package:flutter/material.dart';
import 'package:grad_proj/data/models/plants_model.dart';
import 'custom_cached_network_image.dart';
import 'custom_grid_view_item_footer.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem({super.key, required this.item});
  final Datum item;

  @override
  Widget build(BuildContext context) {
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
              child: CustomCachedNetworkImage(
            image: item.defaultImage.thumbnail,
          )),
          CustomGridViewItemFooter(
            productName: item.commonName ?? "",
          ),
        ],
      ),
    );
  }
}
