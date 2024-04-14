import 'package:flutter/material.dart';
import 'custom_list_view_horizontal_item.dart';

class CustomListViewHorizontal extends StatelessWidget {
  const CustomListViewHorizontal({
    super.key,
    required this.originList,
  });
  final List<String>? originList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemBuilder: (context, index) => CustomListViewHorizontalItem(
          originList: originList,
          index: index,
        ),
        itemCount: originList?.length ?? 1,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
