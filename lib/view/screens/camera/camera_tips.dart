import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/styles.dart';
import '../../widgets/camera/custom_bad_photos_row.dart';
import '../../widgets/camera/custom_snap_tips_good_photo.dart';
import '../../widgets/home/custom_material_button.dart';

class CameraTips extends StatelessWidget {
  const CameraTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Snap Tips',
              style: Styles.textStyle25,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomSnapTipsGoodPhoto(),
            const SizedBox(
              height: 25,
            ),
            const CustomBadPhotosRow(),
            const SizedBox(
              height: 20,
            ),
            CustomMaterialButton(onPressed: (){
              Get.back();
            },text: 'Continue',)
          ],
        ),
      ),
    );
  }
}



