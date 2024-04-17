import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/view/widgets/profile/change_mode.dart';

class CustomSettingItem extends StatelessWidget {
   CustomSettingItem({
     super.key, required this.icon, required this.title, this.onPressed,
    });

  final IconData icon ;
  final String title ;
  final void Function()? onPressed ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(icon,color: AppColors.kPrimaryColor,),
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),
              Text("${title}",style: TextStyle(color: AppColors.kPrimaryColor),),
            ],),
            IconButton(onPressed: onPressed, icon:Icon(Icons.arrow_forward_ios,color: AppColors.kPrimaryColor,))
          ],
        ),
      ],
    );
  }
}
