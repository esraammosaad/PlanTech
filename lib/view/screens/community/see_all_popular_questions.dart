import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/community_controllers/see_all_questions_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/core/shared/custom_loading_icon.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../widgets/home/custom_third_app_bar.dart';
import '../../widgets/plants_community/custom_expansion_tile.dart';

class SeeAllPopularQuestions extends StatelessWidget {
  const SeeAllPopularQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,text: 'Popular Questions'),
      body: SafeArea(
        child: GetBuilder<SeeAllQuestionsControllerImp>(builder: (controller) {
          return controller.isLoading
              ? const Center(child: CustomLoadingIcon(path: 'assets/icons/loading.json'))
              : controller.errMessage != null
                  ? Center(
                      child: Text(
                      controller.errMessage!,
                      style: getValueForScreenType(context: context, mobile: Styles.textStyle12(context)
                          .copyWith(color: AppColors.kGreyColor),tablet: Styles.textStyle25(context)
                          .copyWith(color: AppColors.kGreyColor)),
                    ))
                  : CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.all(5),
                          sliver: SliverList.builder(
                              itemBuilder: (context, index) =>  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: CustomExpansionTile(questions: controller.seeAllDataList[index],isInitiallyExpanded: false),
                                  ),
                              itemCount: controller.seeAllDataList.length),
                        ),
        
                        // const CustomSearchField(),
                      ],
                    );
        }),
      ),
    );
  }
}

