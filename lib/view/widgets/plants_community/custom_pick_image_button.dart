import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/community_controllers/add_post_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/styles.dart';

class CustomPickImageButton extends StatelessWidget {
  const CustomPickImageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPostControllerImp>(builder: (controller) {
      return controller.image == null
          ? Column(
              children: [
                TextButton(
                    onPressed: () {
                      controller.pickImageFromGallery();
                    },
                    child: Text(
                      'pick image',
                      style: getValueForScreenType(
                          context: context,
                          mobile: Styles.textStyle16(context),
                          tablet: Styles.textStyle30(context).copyWith(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.bold)),
                    )),
                const Divider(),
                TextButton(
                    onPressed: () {
                      controller.captureImageFromCamera();
                    },
                    child: Text(
                      'capture image',
                      style: getValueForScreenType(
                          context: context,
                          mobile: Styles.textStyle16(context),
                          tablet: Styles.textStyle30(context).copyWith(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.bold)),
                    )),
              ],
            )
          : Stack(alignment: Alignment.topRight, children: [
              Image.file(controller.image!),
              IconButton(
                  onPressed: () {
                    controller.deletePickedImage();
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.black,
                    size: 28,
                  ))
            ]);
    });
  }
}
