import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/bluetooth/live_stream_controller.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/styles.dart';
import '../../widgets/camera/custom_live_straming_widget.dart';
import '../../widgets/camera/custom_navigation_bar_in_live_stream.dart';
import '../../widgets/camera/custom_show_captured_image_widget.dart';
import '../../widgets/camera/full_screan_stream_widget.dart';
import '../../widgets/camera/get_fab.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class LiveStreaming extends StatefulWidget {
  const LiveStreaming({Key? key}) : super(key: key);

  @override
  State<LiveStreaming> createState() => _LiveStreamingState();
}

class _LiveStreamingState extends State<LiveStreaming> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GetBuilder<LiveStreamControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: controller.isFullScreen?null:customAppBar(context, text: 'Live Stream'),

        body: controller.isFullScreen
            ? FullScreenLiveStreamWidget()
            : OrientationBuilder(builder: (context, orientation) {
                controller.landScapeVideoSize(context, orientation);
                return SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                          child: Stack(
                        children: [
                          CustomLiveStreamingWidget(),
                          Positioned.fill(
                              child: Align(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  controller.image==null?'':'RaspberryPi \n Live | ${controller.timeString} ',
                                  style: Styles.textStyle20(context).copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          )),
                        ],
                      )),
                      controller.isLandscape
                          ? SliverToBoxAdapter()
                          : SliverToBoxAdapter(
                              child: CustomNavigationBarInLiveStream(themeController: themeController),
                            ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        fillOverscroll: false,
                        child: controller.capturedImage != null
                            ? CustomShowCapturedImageWidget()
                            : Center(child: Text('Try To Capture Image')),
                      )
                    ],
                  ),
                );
              }),
        floatingActionButtonLocation: controller.isFullScreen
            ? FloatingActionButtonLocation.startFloat
            : null,
        floatingActionButton: RotatedBox(
          quarterTurns: controller.isFullScreen ? 45 : 0,
          child: GetFab(
            isFullScreen: controller.isFullScreen,
            isLandscape:
                controller.isFullScreen ? true : controller.isLandscape,
            onTapFullScreen: () {
              controller.fullScreenFunction();
            },
          ),
        ),
      );
    });
  }
}




