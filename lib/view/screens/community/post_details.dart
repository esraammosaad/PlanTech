import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/community_controllers/post_details_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/data/models/post_model.dart';
import 'package:grad_proj/view/widgets/plants_community/custom_add_comment_text_field.dart';
import 'package:grad_proj/view/widgets/plants_community/custom_sliver_list_post_item.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../widgets/plants_community/custom_comments_sliver_list.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({Key? key, required this.item, required this.index}) : super(key: key);
final PostModel item;
final int index;
  @override
  Widget build(BuildContext context) {
    PostDetailsControllerImp controller = Get.find();
    return ScreenTypeLayout.builder(
      mobile: (context)=>Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back,color: AppColors.kPrimaryColor,)),
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
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
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
                          child: Text(
                            'Comments Section:',
                            style: Styles.textStyle20.copyWith(
                                fontWeight: FontWeight.w300,
                                color: AppColors.kPrimaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverPadding(
                    sliver: CustomCommentsSliverList(item: item),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                  ),
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: SizedBox(
                      height: 60,
                    ),
                  )
                ],
              ),
              CustomAddCommentTextField(postId: item.postId!),
            ],
          ),
        ),
      ),
      tablet: (context)=>Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back,color: AppColors.kPrimaryColor,)),
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
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomScrollView(
                  controller: controller.scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomSliverListPostItem(
                              item: item, index: index, isDetails: true),
                        ],
                      ),
                    ),
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: SizedBox(
                        height: 60,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomScrollView(
                      controller: controller.scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Comments Section:',
                                  style: Styles.textStyle30.copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.kPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        SliverPadding(
                          sliver: CustomCommentsSliverList(item: item),
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                        ),

                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: CustomAddCommentTextField(postId: item.postId!),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
