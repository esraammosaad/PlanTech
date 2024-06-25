import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../widgets/auth/custom_otp_form.dart';

class OneTimePassword extends StatelessWidget {
  const OneTimePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (context)=>const SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomOtpForm(),
            ),
          ),
        ),
        tablet: (context)=> Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: Container()),
            const Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: SafeArea(
                    child: CustomOtpForm(),
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
