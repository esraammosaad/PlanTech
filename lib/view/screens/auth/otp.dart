import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomOtpForm(),
          ),
        ),
      ),
    );
  }
}
