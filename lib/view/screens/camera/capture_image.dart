import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grad_proj/controller/bluetooth/capture_image_controller.dart';
import 'package:grad_proj/core/constants/styles.dart';
import '../../widgets/camera/custom_capture_image_widget.dart';
import '../../widgets/home/custom_third_app_bar.dart';
class CaptureImage extends StatelessWidget {
  const CaptureImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, text: 'Capture Image'),
      body: GetBuilder<CaptureImageControllerImp>(
        builder: (controller)=> CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: false,
              child: controller.capturedImage != null
                  ? CustomCapturedImageWidget()
                  : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 32.0),
                        //   child: Center(child: Text('Try To Capture Image')),
                        // ),
                        // SizedBox(height: 42,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextButton( child: Text('Capture Image Now',style: Styles.textStyle14(context),), onPressed: (){
                            controller.captureImage();

                          }),
                        ),
                        SizedBox(height: 32,),
                      ],
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
