import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:grad_proj/controller/camera_controllers/model_controller.dart';
import 'package:grad_proj/controller/camera_controllers/my_garden_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/view/widgets/home/custom_material_button.dart';
import '../../../core/constants/styles.dart';

class CameraResult extends StatelessWidget {
  const CameraResult({super.key});

  @override
  Widget build(BuildContext context) {
    File? image = Get.arguments[0];
    return Scaffold(
      body: GetBuilder<ModelControllerImpl>(
          builder: (controller) => SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            color: AppColors.kPrimaryColor,
                            size: 28,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                          child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                        ),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          controller.result == ''
                              ? 'No Result'
                              : controller.result,
                          style: Styles.textStyle25,
                        ),
                      ),
                      GetBuilder<MyGardenControllerImp>(
                        builder: (myGardenController) {
                          return myGardenController.isLoading?Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                          ):CustomMaterialButton(
                                  text: 'Add To Your Garden',
                                  onPressed: () async {

                                    await myGardenController.uploadImage(
                                        result: controller.result, file: image);
                                  });
                        }
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
