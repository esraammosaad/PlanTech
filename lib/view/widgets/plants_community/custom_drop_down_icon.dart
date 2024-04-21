import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/core/functions/awesome_dialog.dart';
import 'package:grad_proj/data/models/post_model.dart';
import '../../../controller/community_controllers/edit_post_controller.dart';
import '../../../core/constants/styles.dart';

class CustomDropdownIcon extends StatelessWidget {
  const CustomDropdownIcon({
    super.key,
    required this.item,
  });
  final PostModel item;

  @override
  Widget build(BuildContext context) {
    EditAndDeletePostControllerImp controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonHideUnderline(

          child: DropdownButton2(

        dropdownStyleData: const DropdownStyleData(

          width: 100,
        ),
        onChanged: (value) {},


        customButton: const Icon(
          Icons.more_horiz_rounded,
          size: 24,
          color: Colors.black,
        ),

        items: [
          DropdownMenuItem(
            enabled: false,



            value: 'Edit',
            child: GestureDetector(
                onTap: () {
                  controller.controller.text = item.post ?? "";
                  Get.toNamed(AppRoutes.editPostScreen, arguments: [item]);

                },
                child: Text(
                  'Edit',
                  style: Styles.textStyle10,
                )),
          ),
          DropdownMenuItem(
            enabled: false,

            value: 'Delete',
            child: GestureDetector(
                onTap: () {
                  showAwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      title: 'Do you want to delete your post? ',
                      desc: '',
                      okOnPress: () async {
                        Get.back();
                        await controller.deletePost(postId: item.postId!, fileUrl: item.fileUrl);
                        print(item.fileUrl);
                      },
                      cancelOnPress: () {
                        Get.back();
                      });
                },
                child: Text(
                  'Delete',
                  style: Styles.textStyle10,
                )),
          )
        ],
      )),
    );
  }
}
