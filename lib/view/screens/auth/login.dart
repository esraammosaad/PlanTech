import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/functions/alert_dialog.dart';
import '../../widgets/auth/custom_login_form.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PopScope(
        canPop: false,
        onPopInvoked: (p) => alertExitApp(context),
        child: ScreenTypeLayout.builder(
          mobile: (context) => const SingleChildScrollView(
            child: SafeArea(
              child: CustomLogInForm(),
            ),
          ),
          tablet: (context) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: Container()),
              const Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 32.0),
                    child: SafeArea(
                      child: CustomLogInForm(),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
