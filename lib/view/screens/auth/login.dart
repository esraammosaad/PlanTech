import 'package:flutter/material.dart';
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
        onPopInvoked: (p) => alertExitApp(),
        child: const SingleChildScrollView(
          child: SafeArea(
            child: CustomLogInForm(),
          ),
        ),
      ),
    );
  }
}
