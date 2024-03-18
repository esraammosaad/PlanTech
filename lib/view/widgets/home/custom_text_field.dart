import 'package:flutter/material.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
          hintText: 'Search of home production',
          hintStyle: Styles.textStyle16.copyWith(
              color: Colors.grey[400], fontFamily: AppFonts.kEnglishFont),
          prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey[500],
                size: 22,
              )),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          filled: true,
          fillColor: Colors.grey[200]),
    );
  }
}
