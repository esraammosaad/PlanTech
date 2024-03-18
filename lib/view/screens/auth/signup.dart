import 'package:flutter/material.dart';
import '../../widgets/auth/custom_signup_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: CustomSignUpForm(),
        ),
      ),
    );
  }
}
