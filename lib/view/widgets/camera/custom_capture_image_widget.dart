import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/controller/bluetooth/capture_image_controller.dart';
import 'package:grad_proj/view/widgets/home/custom_material_button.dart';
import '../../../controller/camera_controllers/my_garden_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
class CustomCapturedImageWidget extends StatelessWidget {
  const CustomCapturedImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CaptureImageControllerImp>(
        builder: (controller) {
          return Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Image.file(controller.capturedImage!),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: controller.accuracy==null?MainAxisAlignment.center:MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      alignment:Alignment.centerLeft,
                      fit: BoxFit.contain,

                      child: Text(
                        textAlign: TextAlign.center,
                        controller.result == null ||
                            controller.result == ''
                            ? 'Loading...'
                            : controller.result!,
                        style: Styles.textStyle20(context)
                            .copyWith(color: Colors.black),
                      ),
                    ),controller.accuracy!=null?FittedBox(
                      fit: BoxFit.contain,
                       alignment: Alignment.centerLeft,
                      child: Text(

                        'Accuracy '+(controller.accuracy!*100).toString().substring(0,4)+'%',
                        style: Styles.textStyle16(context)
                            .copyWith(color: Colors.black,fontWeight: FontWeight.w300),
                      ),
                    ):SizedBox(),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextButton( child: Text('Try To Capture Image Again',style: Styles.textStyle14(context),), onPressed: (){
                  controller.captureImage();

                }),
              ),
              GetBuilder<MyGardenControllerImp>(
                  builder: (myGardenController) {
                    return myGardenController.isLoading
                        ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    )
                     : myGardenController.status=='Successfully Added'?CircleAvatar(radius: 25,backgroundColor: AppColors.kPrimaryColor,child:Icon( Icons.check,size: 25,color: AppColors.backgroundColor,),) : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomMaterialButton(
                          text: 'Add To Your Garden',
                          onPressed: () async {
                            await myGardenController
                                .uploadImage(
                                result: controller.result??'',
                                file: controller.capturedImage!);
                          }),
                        );
                  }),
            ],
          );
        }
    );
  }
}
