import 'package:flutter/material.dart';
import 'package:grad_proj/core/shared/custom_button.dart';
import '../constants/color.dart';
import '../constants/styles.dart';
class CustomBottomSheetItem extends StatelessWidget {
  const CustomBottomSheetItem({
    super.key,
    required this.text, required this.onTap, required this.buttonText,
  });
  final String text;
  final VoidCallback onTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              Icon(Icons.check_circle_outline,color: AppColors.kPrimaryColor,size: MediaQuery.of(context).size.width * 0.3,),
              const SizedBox(
                height: 18,
              ),
              Text(
                text,
                style: Styles.textStyle20,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 18,
              ),
              CustomButton(text: buttonText, onTap: onTap)

            ],
          ),
        ),
      ),
    );
  }
}
