import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/view/widgets/profile/change_mode.dart';

class CustomSettingItem extends StatelessWidget {
   const CustomSettingItem({
     super.key, required this.icon, required this.title, required this.onPressed,
    });

  final IconData icon ;
  final String title ;
  final VoidCallback onPressed ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(icon,color: AppColors.kPrimaryColor,),
              const SizedBox(width: 8,),
              Text(title,style: TextStyle(color: AppColors.kPrimaryColor),),
            ],),
            IconButton(onPressed: onPressed, icon:Icon(Icons.arrow_forward_ios,color: AppColors.kPrimaryColor,))
          ],
        ),
      ],
    );
  }
}
