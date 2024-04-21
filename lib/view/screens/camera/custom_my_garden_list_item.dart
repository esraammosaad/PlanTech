import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/camera_controllers/my_garden_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
import '../../../core/functions/awesome_dialog.dart';
import '../../widgets/home/custom_cached_network_image.dart';

class CustomMyGardenListItem extends StatelessWidget {
  const CustomMyGardenListItem({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyGardenControllerImp>(builder: (controller) {
      return Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.backgroundColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.backgroundColor,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CustomCachedNetworkImage(
                          image: controller.myGarden![index].image),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            controller.myGarden![index].result,
                            style: Styles.textStyle25,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              controller.updatePostTime(
                                loadedTime: controller.myGarden![index].time!,
                              ),
                              style: Styles.textStyle14,
                            )),
                      ],
                    ))
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: IconButton(
                onPressed: () async {
                  showAwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      title: 'Do you want to delete this plant?',
                      desc: '',
                      okOnPress: () async {
                        await controller.deleteFromMyGarden(
                            id: controller.myGarden![index].id,
                            fileUrl: controller.myGarden![index].image);
                      },
                      cancelOnPress: () {});
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: AppColors.kPrimaryColor,
                  size: 24,
                )),
          )
        ],
      );
    });
  }
}
