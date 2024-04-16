import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/plants_details_controllers/care_guide_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/core/shared/custom_loading_icon.dart';
import '../../../core/constants/fonts.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class CareGuide extends StatelessWidget {
  const CareGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: 'Care Guide'),
      body: GetBuilder<CareGuideControllerImp>(builder: (controller) {
        return controller.isLoading
            ? const CustomLoadingIcon(path: 'assets/icons/loading.json')
            : controller.errMessage != null
                ? Center(
                    child: Text(
                    controller.errMessage!,
                    style: Styles.textStyle12
                        .copyWith(color: AppColors.kGreyColor),
                  ))
                : CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.all(8),
                        sliver: SliverToBoxAdapter(
                          child: FittedBox(
                              alignment: Alignment.centerLeft,
                              fit: BoxFit.scaleDown,
                              child: Text(
                                controller.careGuideData?.commonName ?? "",
                                style: Styles.textStyle25,
                              )),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(5),
                        sliver: SliverList.builder(
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: ExpansionTile(
                                    title: Text(
                                      controller.careGuideData?.section?[index]
                                              ?.type ??
                                          '',
                                      style: Styles.textStyle20.copyWith(
                                          fontFamily: AppFonts.kArabicFont,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: AppColors.backgroundColor,
                                    collapsedBackgroundColor:
                                        AppColors.backgroundColor,
                                    childrenPadding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    collapsedIconColor: AppColors.kPrimaryColor,
                                    iconColor: AppColors.kPrimaryColor,
                                    initiallyExpanded: true,
                                    children: [
                                      Text(
                                        controller
                                                .careGuideData
                                                ?.section?[index]
                                                ?.description ??
                                            '',
                                        style: Styles.textStyle14.copyWith(
                                            color: AppColors.greyColor,
                                            fontFamily: AppFonts.kArabicFont,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.justify,
                                      )
                                    ],
                                  ),
                                ),
                            itemCount:
                                controller.careGuideData?.section?.length),
                      ),

                      // const CustomSearchField(),
                    ],
                  );
      }),
    );
  }
}
