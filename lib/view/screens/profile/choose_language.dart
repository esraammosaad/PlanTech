import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/core/localization/change_local.dart';
import 'package:grad_proj/core/shared/custom_button.dart';
import 'package:get/get.dart';
import '../../widgets/home/custom_third_app_bar.dart';

class ChooseLanguageSettings extends GetView<LocaleController> {
  const ChooseLanguageSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: customAppBar(context,text: 'Language'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1'.tr,
              style: Styles.textStyle20(context),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                text: '3'.tr,
                onTap: () {
                  controller.changeLang('ar');
                }),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                text: '2'.tr,
                onTap: () {
                  controller.changeLang('en');
                }),

          ],
        ),
      ),
    );
  }
}
