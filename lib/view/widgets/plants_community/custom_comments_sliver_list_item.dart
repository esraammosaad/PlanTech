import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/post_details_controller.dart';
import 'package:grad_proj/data/models/post_model.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
import '../home/custom_profile_avatar.dart';
import 'custom_comment_like_icon.dart';
class CustomCommentsSliverListItem extends StatelessWidget {
  const CustomCommentsSliverListItem({
    super.key, required this.index, required this.item,
  });
  final int index;
  final PostModel item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailsControllerImp>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0,),
          child: Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:  BorderSide(color: AppColors.kGreyColor)),
            child: ListTile(
              leading: SizedBox(
                width: 40,
                height: 40,
                child: CustomProfileAvatar(
                  image: controller.comments[index].userImage ??
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.comments[index].userName ??
                        'person',
                    style: Styles.textStyle12
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    controller.comments[index].comment??"",
                    style: Styles.textStyle14
                        .copyWith(color: AppColors.kPrimaryColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(
              controller.updateCommentTime(loadedTime: controller.comments[index].time!),
                    style: Styles.textStyle12
                        .copyWith(color: AppColors.kGreyColor),
                  ),
                  const Spacer(),
                  CustomCommentLikeIcon(index: index, item: item),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    controller.comments[index].likes!.length.toString(),
                    style: Styles.textStyle12,
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

