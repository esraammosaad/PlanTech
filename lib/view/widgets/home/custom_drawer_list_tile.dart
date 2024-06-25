import 'package:flutter/material.dart';
import '../../../data/models/drawer_model.dart';
import 'active_and_inactive_list_tile.dart';

class CustomDrawerListTile extends StatelessWidget {
  const CustomDrawerListTile({
    super.key,
    required this.item,
    required this.selectedIndex,
    required this.index,
  });

  final DrawerModel item;
  final int selectedIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return selectedIndex == index
        ? ActiveListTile(item: item)
        : InActiveListTile(item: item);
  }
}
