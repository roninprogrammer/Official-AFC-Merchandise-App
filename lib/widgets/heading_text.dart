import 'package:afc_assignment/constants/app_color.dart';
import 'package:afc_assignment/constants/size.dart';
import 'package:flutter/material.dart';

class AuthHeadingText extends StatelessWidget {
  const AuthHeadingText({super.key, this.text, @required this.fontSize, this.textAlign});
  final String? text;
  final double? fontSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: headingTextStyle(),
    );
  }

  TextStyle headingTextStyle() {
    return TextStyle(
      fontSize: getTextSize(fontSize!),
      fontWeight: FontWeight.w800,
      color: kDark,
    );
  }
}
