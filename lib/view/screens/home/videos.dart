import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/data/models/onboardingmodel.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class PlantsVideos extends StatefulWidget {
  const PlantsVideos({Key? key}) : super(key: key);


  @override
  State<PlantsVideos> createState() => _PlantsVideosState();
}

class _PlantsVideosState extends State<PlantsVideos> {
  late CustomVideoPlayerController videoController;
  OnBoardingModel item=Get.arguments[0];
  // List<String> videos = [
  //   'assets/videos/IMG_3817.MP4',
  //   'assets/videos/IMG_3818.MP4',
  //   'assets/videos/IMG_3820.MP4',
  //   'assets/videos/IMG_3819.MP4',
  //   'assets/videos/IMG_3821.MP4',
  //   'assets/videos/IMG_3822.MP4'
  // ];
  // List<String> titles = [
  //   'How to care about home plants? part one',
  //   'How to care about home plants? part two',
  //   'Watering plants with tea and coffee useful!?',
  //   'Fertilizing the plants with eggs and bananas useful!?',
  //   'Information abut corn crop part one',
  //   'Information abut corn crop part two'
  // ];
  // List controllers = [];
  @override
  void initState() {
    initialVideoPlayer();
    super.initState();
  }

  dispose(){
    super.dispose();
    videoController.dispose();


  }


  initialVideoPlayer() {
    late CachedVideoPlayerController videoPlayerController;
      videoPlayerController = CachedVideoPlayerController.asset(item.image!)
        ..initialize().then((value) {
          setState(() {});
        });
      videoController = CustomVideoPlayerController(
          context: context, videoPlayerController: videoPlayerController);
      // controllers.add(videoController);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, text: 'Plants Videos'),
      body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              collapsedIconColor: AppColors.kPrimaryColor,
              iconColor: Colors.black,
              title: Text(
                item.title!,
                style: Styles.textStyle20(context)
                    .copyWith(color: AppColors.kPrimaryColor),
              ),
              children: [
                SizedBox(
                  height: 16,
                ),
                CustomVideoPlayer(
                    customVideoPlayerController: videoController),
              ],
            ),
          )


    );
  }
}
