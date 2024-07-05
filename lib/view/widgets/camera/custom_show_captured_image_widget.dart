import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/controller/bluetooth/capture_image_controller.dart';
import '../../../controller/bluetooth/live_stream_controller.dart';
import '../../../core/constants/styles.dart';
class CustomShowCapturedImageWidget extends StatelessWidget {
  const CustomShowCapturedImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveStreamControllerImp>(
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
                    Text(
                      textAlign: TextAlign.center,
                      controller.result == null ||
                          controller.result == ''
                          ? 'Loading Result .......'
                          : controller.result!,
                      style: Styles.textStyle20(context)
                          .copyWith(color: Colors.black),
                    ),controller.accuracy!=null?Text(

                      'Accuracy '+(controller.accuracy!*100).toString().substring(0,4)+'%',
                      style: Styles.textStyle16(context)
                          .copyWith(color: Colors.black,fontWeight: FontWeight.w300),
                    ):SizedBox(),
                  ],
                ),
              ),
            ],
          );
        }
    );
  }
}
