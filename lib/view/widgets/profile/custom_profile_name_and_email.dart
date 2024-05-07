import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/profile_controller.dart';
import 'package:grad_proj/view/widgets/profile/custom_profile_column.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';
class CustomProfileNameAndEmail extends StatelessWidget {
  const CustomProfileNameAndEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImpl>(
      builder: (controller) {
        return controller.isLoading?const Padding(
          padding: EdgeInsets.all(45.0),
          child: CustomCenterLoadingIndicator(),
        ):Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              alignment: AlignmentDirectional.centerStart,
              fit: BoxFit.scaleDown,
              child: Text(
                controller.userData.name ==
                    '' ?'person'
                    : controller.userData.name,
                style: Styles.textStyle25.copyWith(
                    color: Colors.grey[950],
                    fontFamily: AppFonts.kArabicFont),
              ),
            ),
            FittedBox(
              alignment: AlignmentDirectional.centerStart,
              fit: BoxFit.scaleDown,
              child: Text(
                controller.userData.email ==
                    ''
                    ? 'person'
                    : controller.userData.email,
                style: Styles.textStyle14.copyWith(
                    color: Colors.grey[600],
                    fontFamily: AppFonts.kArabicFont),
              ),
            ),
          ],
        );
      }
    );
  }
}
