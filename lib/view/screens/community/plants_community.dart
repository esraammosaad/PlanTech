import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/view/widgets/home/custom_text_row.dart';
import 'package:grad_proj/view/widgets/plants_community/custom_create_post_field.dart';
import 'package:grad_proj/view/widgets/plants_community/custom_popular_questions_list.dart';
import '../../widgets/home/custom_another_app_bar.dart';
import '../../widgets/plants_community/custom_plants_community_sliver_list.dart';

class PlantsCommunity extends StatelessWidget {
  const PlantsCommunity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
        ),
        child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                        child: CustomAnotherAppBar(text: 'Plants Community')),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      sliver: SliverToBoxAdapter(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomCreatePostField(),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextRow(text: 'Popular Questions',onTap: (){
                            Get.toNamed(AppRoutes.seeAllPopularQuestionsScreen);
      
                          }),
                          const SizedBox(
                            height: 12,
                          ),
                          const CustomPopularQuestionsList(),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      )),
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      sliver: CustomPlantsCommunitySliverList(),
                    ),
                  ],
                )
      
      ),
    );
  }
}
