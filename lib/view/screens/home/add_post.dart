import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/add_post_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/view/widgets/home/custom_material_button.dart';
import 'package:grad_proj/view/widgets/plants_community/custom_pick_image_button.dart';
import '../../widgets/plants_community/custom_add_post_header.dart';
import '../../widgets/plants_community/custom_add_post_text_field.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'post   ',
              style: Styles.textStyle16,
            ),
          ),
        ],
      ),
      body: GetBuilder<AddPostControllerImp>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
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
                      const CustomPickImageButton(),
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
                              text: 'post',
                              onPressed: () {
                                controller.addPost();
                                controller.controller.clear();
                              },
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
