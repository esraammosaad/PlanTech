import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import '../../../controller/community_controllers/plants_community_controller.dart';
import 'custom_popular_questions_list_item.dart';

class CustomPopularQuestionsList extends StatelessWidget {
  const CustomPopularQuestionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GetBuilder<PlantsCommunityControllerImp>(builder: (controller) {
        return controller.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.kPrimaryColor,
                ),
              )
            : controller.errMessage != null
                ? Center(
                    child: Text(
                    controller.errMessage!,
                    style: Styles.textStyle12
                        .copyWith(color: AppColors.kGreyColor),
                  ))
                : ListView.builder(
                    itemBuilder: (context, index) => AspectRatio(
                      aspectRatio: 2,
                      child: CustomPopularQuestionsListItem(
                          question: controller.questionsList[index]),
                    ),
                    itemCount: controller.questionsList.length,
                    scrollDirection: Axis.horizontal,
                  );
      }),
    );
  }
}
