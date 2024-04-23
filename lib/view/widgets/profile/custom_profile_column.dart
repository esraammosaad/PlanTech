import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/profile_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/functions/awesome_dialog.dart';
import 'custom_edit_photo_widget.dart';
import 'custom_text_field.dart';

class CustomProfileColumn extends StatelessWidget {
  const CustomProfileColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImpl>(builder: (controller) {
      return Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomEditPhotoWidget(),
          const SizedBox(
            height: 16,
          ),
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
          CustomTextField(
            widget:controller.isLoadingEmail
                ? const CustomCenterLoadingIndicator()
                :  CustomConfirmEditProfileButton(onTap: () async {
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
                    email: controller.emailController.text, context: context);
              }
            }),
            text: 'Edit your email',
            controller: controller.emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            text: 'Edit your password',
            widget:controller.isLoadingPassword
                ? const CustomCenterLoadingIndicator()
                :  CustomConfirmEditProfileButton(onTap: () async {
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
                    password: controller.passwordController.text, context: context);
              }
            }),
            controller: controller.passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
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

class CustomCenterLoadingIndicator extends StatelessWidget {
  const CustomCenterLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
