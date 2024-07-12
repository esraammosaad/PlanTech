import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/bluetooth/image_stream_controller.dart';
import 'package:grad_proj/controller/camera_controllers/my_garden_controller.dart';
import 'package:grad_proj/core/constants/fonts.dart';
import 'package:grad_proj/core/shared/custom_button.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class ImageStreaming extends StatelessWidget {
  const ImageStreaming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();

    return Scaffold(
      appBar: customAppBar(context, text: 'Image Stream'),
      body: GetBuilder<ImageStreamControllerImp>(
        builder: (controller) => controller.imageFileList.isEmpty
            ? CustomImageStreamStarting()
            : ListView.builder(
                itemBuilder: (context, index) => Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: themeController.isDarkMode.value
                        ? Colors.black26
                        : AppColors.backgroundColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 0.9,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: themeController.isDarkMode.value
                                  ? Colors.black26
                                  : AppColors.backgroundColor,
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.file(
                              controller.imageFileList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      controller.resultList[index] ?? '',
                                      style:
                                          Styles.textStyle20(context).copyWith(
                                        color: themeController.isDarkMode.value
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    (controller.accuracyList[index]! * 100)
                                            .toString()
                                            .substring(0, 5) +
                                        '%',
                                    style: Styles.textStyle12(context).copyWith(
                                      color: themeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GetBuilder<MyGardenControllerImp>(
                                  builder: (myGardenController) {
                                return myGardenController.isLoading &&
                                        myGardenController.selectedIndex
                                            .contains(index)
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: AppColors.kPrimaryColor,
                                          ),
                                        ),
                                      )
                                    : myGardenController.status ==
                                                'Successfully Added' &&
                                            myGardenController.selectedIndex
                                                .contains(index)
                                        ? CircleAvatar(
                                            radius: 25,
                                            backgroundColor:
                                                AppColors.kPrimaryColor,
                                            child: Icon(
                                              Icons.check,
                                              size: 25,
                                              color: AppColors.backgroundColor,
                                            ),
                                          )
                                        : MaterialButton(
                                            onPressed: () async {
                                              myGardenController
                                                  .selectIndex(index);
                                              await myGardenController
                                                  .uploadImage(
                                                      result:
                                                          controller.resultList[
                                                                  index] ??
                                                              "",
                                                      file: controller
                                                              .imageFileList[
                                                          index]);
                                            },
                                            color: AppColors.kPrimaryColor,
                                            padding: const EdgeInsets.all(9),
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide(
                                                    color: AppColors
                                                        .kPrimaryColor)),
                                            child: Text(
                                              "Add To Your Garden",
                                              style: getValueForScreenType(
                                                  context: context,
                                                  mobile: Styles.textStyle13(
                                                          context)
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                  tablet: Styles.textStyle20(
                                                          context)
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                            ),
                                          );
                              }),
                            ],
                          ))
                    ],
                  ),
                ),
                itemCount: controller.imageFileList.length,
              ),
      ),
      bottomSheet: GetBuilder<ImageStreamControllerImp>(
          builder: (controller) => controller.imageFileList.isEmpty
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(
                      text: 'Stop Streaming',
                      onTap: () {
                        controller.stopImageStream();
                      }),
                )),
    );
  }
}

class CustomImageStreamStarting extends StatelessWidget {
  const CustomImageStreamStarting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GetBuilder<ImageStreamControllerImp>(builder: (controller) {
      return SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: double.infinity,
                    child: Text(
                        style: Styles.textStyle16(context).copyWith(
                            color: themeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w300,
                            fontFamily: AppFonts.kArabicFont),
                        'Start Image Stream Now And Receive New Image Of your Garden Every Your Favorite Number Of Seconds')),
                SizedBox(
                  height: 35,
                ),
                Text('Choose Interval'),
                SizedBox(
                  height: 20,
                ),
                NumberPicker(
                    value: controller.chooseInterval,
                    minValue: 0,
                    itemHeight: 30,
                    itemWidth: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: themeController.isDarkMode.value
                              ? AppColors.kPrimaryColor
                              : AppColors.kGreyColor,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    axis: Axis.horizontal,
                    maxValue: 20,
                    onChanged: (value) {
                      controller.pickInterval(value);
                    }),
                SizedBox(
                  height: 20,
                ),
                controller.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                      )
                    : MaterialButton(
                        onPressed: () {
                          controller.startImageStream(controller.chooseInterval );
                        },
                        child: Text('Start Image Stream'),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: AppColors.kGreyColor)),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
