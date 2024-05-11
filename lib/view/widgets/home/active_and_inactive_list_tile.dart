import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/styles.dart';
import '../../../core/constants/color.dart';
import '../../../data/models/drawer_model.dart';

class ActiveListTile extends StatelessWidget {
  const ActiveListTile({
    super.key,
    required this.item,

  });

  final DrawerModel item;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Icon(item.icon),
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          item.title,
          style:
          Styles.textStyle16(context).copyWith(color: Colors.grey),
        ),
      ),
      trailing: Container(
        width: 3.27,
        color: AppColors.kPrimaryColor,
      )
      ,
    );
  }
}
class InActiveListTile extends StatelessWidget {
  const InActiveListTile({
    super.key,
    required this.item,

  });

  final DrawerModel item;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(item.icon),
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          item.title,
          style:Styles.textStyle16(context).copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}