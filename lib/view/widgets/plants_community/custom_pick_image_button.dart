import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/add_post_controller.dart';
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
                      style: Styles.textStyle16,
                    )),
                const Divider(),
                TextButton(
                    onPressed: () {
                      controller.captureImageFromCamera();
                    },
                    child: Text(
                      'capture image',
                      style: Styles.textStyle16,
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
