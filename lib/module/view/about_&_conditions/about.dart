import 'package:afc_assignment/constants/app_color.dart';
import 'package:afc_assignment/constants/app_text.dart';
import 'package:afc_assignment/constants/assets_path.dart';
import 'package:afc_assignment/constants/size.dart';
import 'package:afc_assignment/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      aboutImg,
                      height: getScreenHeight(215),
                      width: getScreeWidth(335),
                      fit: BoxFit.cover,
                    ),
                  ),
                  getVerticalSpace(20),
                  Text(
                    "About Us",
                    style: TextStyle(
                        fontSize: getTextSize(17), fontWeight: FontWeight.w700),
                  ),
                  getVerticalSpace(15),
                  Text(
                    loremDummyText,
                    // textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: getTextSize(15),
                      fontWeight: FontWeight.w400,
                      color: kLightText,
                      letterSpacing: 0.17,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            getVerticalSpace(20),
            CustomButton(
              widthValue: getScreeWidth(335),
              color: kPrimary,
              text: "Back To Previous",
              press: () => Get.back(),
            ),
            getVerticalSpace(20),
          ],
        ),
      ),
    );
  }
}
