import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/core/functions/awesome_dialog.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../controller/profile_controllers/edit_profile_controller.dart';
import 'custom_center_loading_indicator.dart';
import 'custom_edit_photo_widget.dart';
import 'custom_text_field.dart';

class CustomProfileColumn extends StatelessWidget {
  const CustomProfileColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileControllerImpl>(builder: (controller) {
      return Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomEditPhotoWidget(),
          const SizedBox(
            height: 16,
          ),
          const CustomEditProfileText(text: 'Username :'),
          CustomTextField(
            widget: controller.isLoadingName
                ? const CustomCenterLoadingIndicator()
                : CustomConfirmEditProfileButton(onTap: () async {
                    if (controller.userData.name ==
                        controller.usernameController.text) {
                      showAwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          title: 'Please enter new name',
                          desc: '',
                          okOnPress: () {},
                          cancelOnPress: () {});
                    } else {
                      await controller.updateUserName(
                          name: controller.usernameController.text,
                          context: context);
                    }
                  }),
            text: 'Edit your username',
            controller: controller.usernameController,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomEditProfileText(text: 'Email :'),
          CustomTextField(
            widget: controller.isLoadingEmail
                ? const CustomCenterLoadingIndicator()
                : CustomConfirmEditProfileButton(onTap: () async {
                    if (controller.userData.email ==
                        controller.emailController.text) {
                      showAwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          title: 'Please enter new email',
                          desc: '',
                          okOnPress: () {},
                          cancelOnPress: () {});
                    } else {
                      await controller.updateUserEmail(
                          email: controller.emailController.text,
                          context: context);
                    }
                  }),
            text: 'Edit your email',
            controller: controller.emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomEditProfileText(text: 'Password :'),
          CustomTextField(
            text: 'Edit your password',
            widget: controller.isLoadingPassword
                ? const CustomCenterLoadingIndicator()
                : CustomConfirmEditProfileButton(onTap: () async {
                    if (controller.userData.password ==
                        controller.passwordController.text) {
                      showAwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          title: 'Please enter new password',
                          desc: '',
                          okOnPress: () {},
                          cancelOnPress: () {});
                    } else {
                      await controller.updateUserPassword(
                          password: controller.passwordController.text,
                          context: context);
                    }
                  }),
            controller: controller.passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomEditProfileText(text: 'Phone Number :'),
          CustomTextField(
            text: 'Edit your phone number',
            widget: controller.isLoadingNumber
                ? const CustomCenterLoadingIndicator()
                : CustomConfirmEditProfileButton(onTap: () {}),
            controller: controller.phoneNumberController,
          ),
        ],
      );
    });
  }
}

class CustomEditProfileText extends StatelessWidget {
  const CustomEditProfileText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: getValueForScreenType(
              context: context,
              mobile: Styles.textStyle16(context),
              tablet: Styles.textStyle25(context)
                  .copyWith(color: AppColors.kPrimaryColor)),
        ));
  }
}
