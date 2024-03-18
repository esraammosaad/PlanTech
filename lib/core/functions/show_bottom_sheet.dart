import 'package:flutter/material.dart';
import '../shared/custom_bottom_sheet_item.dart';

Future<void> buildShowModalBottomSheet(
    {required BuildContext context,
    required String text,
    required String buttonText,
    required VoidCallback onTap}) {
  return showModalBottomSheet<void>(
    shape: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
      topRight: Radius.circular(32),
      topLeft: Radius.circular(32),
    )),
    context: context,
    builder: (BuildContext context) {
      return CustomBottomSheetItem(
        text: text,onTap: onTap,buttonText: buttonText,
      );
    },
  );
}

