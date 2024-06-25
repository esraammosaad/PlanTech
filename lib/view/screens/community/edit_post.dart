import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/data/models/post_model.dart';
import 'package:grad_proj/view/widgets/plants_community/custom_edit_and_add_post_app_bar.dart';
import 'package:grad_proj/view/widgets/home/custom_cached_network_image.dart';
import 'package:grad_proj/view/widgets/home/custom_material_button.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../controller/community_controllers/edit_post_controller.dart';
import '../../widgets/plants_community/custom_add_post_header.dart';
import '../../widgets/plants_community/custom_add_post_text_field.dart';

class EditPost extends StatelessWidget {
  const EditPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostModel  ? item = Get.arguments?[0];
    return Scaffold(
      appBar: customEditAndAddPostAppBar(context, text: 'Editing  '),
      body: SafeArea(
        child: GetBuilder<EditAndDeletePostControllerImp>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ScreenTypeLayout.builder(mobile: (context)=>CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomAddPostHeader(),
                        CustomAddPostTextField(controller: controller.controller),
                        const SizedBox(
                          height: 16,
                        ),
                        item?.fileUrl == '' || item?.fileUrl == null
                            ? const SizedBox()
                            : CustomCachedNetworkImage(
                          image: item?.fileUrl!,
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        controller.isLoading
                            ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.kPrimaryColor,
                          ),
                        )
                            : CustomMaterialButton(
                          text: 'submit',
                          onPressed: () async {

                            await controller.editPost(
                                postId: item!.postId!,
                                post: controller.controller.text,
                                fileUrl: item.fileUrl ?? "");


                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),tablet: (context)=>Row(

                children: [

                  Expanded(flex: 1,child: Container( )),
                  Expanded(flex: 5,child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomAddPostHeader(),
                            CustomAddPostTextField(controller: controller.controller),
                            const SizedBox(
                              height: 16,
                            ),
                            item?.fileUrl == '' || item?.fileUrl == null
                                ? const SizedBox()
                                : CustomCachedNetworkImage(
                              image: item?.fileUrl!,
                            ),
                            const SizedBox(
                              height: 50,
                            ),

                            controller.isLoading
                                ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.kPrimaryColor,
                              ),
                            )
                                : CustomMaterialButton(
                              text: 'submit',
                              onPressed: () async {

                                await controller.editPost(
                                    postId: item!.postId!,
                                    post: controller.controller.text,
                                    fileUrl: item.fileUrl ?? "");


                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  Expanded(flex: 1,child: Container( )),

                ],
              ),),
            ),
          );
        }),
      ),
    );
  }
}
