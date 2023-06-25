import 'package:fantastic_assistant/utils/colors.dart';
import 'package:fantastic_assistant/utils/styles.dart';
import 'package:flutter/material.dart';

void showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: MyColors.white,
      content: Center(
        child: Text(
          content,
          style: MyTextStyles.spaceGrotesk15regular400black,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 140, right: 20, left: 20),
      dismissDirection: DismissDirection.none,
    ),
  );
}
