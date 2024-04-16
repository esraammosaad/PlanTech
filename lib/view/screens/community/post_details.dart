import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/community_controllers/post_details_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/data/models/post_model.dart';
import 'package:grad_proj/view/widgets/plants_community/custom_add_comment_text_field.dart';
import 'package:grad_proj/view/widgets/plants_community/custom_sliver_list_post_item.dart';
import '../../widgets/plants_community/custom_comments_sliver_list.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    PostDetailsControllerImp controller=Get.find();
    PostModel item = Get.arguments[0];
    int index = Get.arguments[1];
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'post details',
              style: Styles.textStyle16,
            ),
          ),
        ],
      ),
      body:
      CustomScrollView(
        controller: controller.scrollController,
        slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSliverListPostItem(
                        item: item, index: index, isDetails: true),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Comments Section:',style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w300,color: AppColors.kPrimaryColor),),
                    )
                  ],
                ),
              ),
               CustomCommentsSliverList(item: item),
              const SliverFillRemaining(
                hasScrollBody: false,
                child: SizedBox(
                  height: 60,
                ),
              )
            ],

      ),
      bottomSheet: CustomAddCommentTextField(postId: item.postId!),
    );
  }
}
