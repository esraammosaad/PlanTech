import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/models/popular_questions_model.dart';
import 'package:grad_proj/view/widgets/plants_community/custom_expansion_tile.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class PopularQuestions extends StatelessWidget {
  const PopularQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Questions question =Get.arguments[0];
    return Scaffold(
      appBar: customAppBar(text: 'Popular Questions'),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomExpansionTile(questions: question,isInitiallyExpanded: true),
          ),
        ],
      ),
    );
  }
}
