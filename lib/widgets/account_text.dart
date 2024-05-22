import 'package:afc_assignment/constants/app_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountText extends StatelessWidget {
  const AccountText({super.key, this.text, this.authText, this.press});
  final String? text;
  final String? authText;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$text?\t\t",
        style: Get.textTheme.titleSmall!.copyWith(
          color: kLightText,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: authText,
            recognizer: TapGestureRecognizer()..onTap = press,
            style: Get.textTheme.titleSmall!.copyWith(
              color: kDark,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
