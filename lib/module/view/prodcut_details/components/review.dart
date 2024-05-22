import 'package:afc_assignment/constants/app_color.dart';
import 'package:afc_assignment/constants/app_constants.dart';
import 'package:afc_assignment/constants/app_text.dart';
import 'package:afc_assignment/constants/assets_path.dart';
import 'package:afc_assignment/constants/size.dart';
import 'package:afc_assignment/module/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DescriptionPanel extends StatelessWidget {
  const DescriptionPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Service(),
        Description(),
        ReviewRatings(),
      ],
    );
  }
}

class Service extends StatelessWidget {
  const Service({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 15,
          color: Color.fromRGBO(0, 0, 0, 0.05),
        )
      ]),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: ResponsiveSize.screenWidth * 0.3,
            child: Text(
              "Service:",
              style: descriptionText(),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(
                  serviceList.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(top: index != 0 ? 10.0 : 0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          tickIcon,
                          height: 12,
                        ),
                        getHorizontalSpace(5),
                        Text(
                          serviceList[index],
                          style: TextStyle(
                            letterSpacing: 0.3,
                            // height: 1.2,
                            color: kDark,
                            fontSize: getTextSize(12),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // Icon(
          //   Icons.arrow_forward_ios,
          //   size: 15,
          //   color: kAppIcon,
          // ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController dataCtrl = Get.find();
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 15,
          color: Color.fromRGBO(0, 0, 0, 0.05),
        )
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: ResponsiveSize.screenWidth * 0.3,
              child: Text(
                "Description:",
                style: descriptionText(),
              )),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataCtrl.productDetails.value.description!,
                  style: TextStyle(
                    letterSpacing: 0.3,
                    height: 1.8,
                    color: kDark,
                    fontSize: getTextSize(12),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewRatings extends StatelessWidget {
  const ReviewRatings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 15,
          color: Color.fromRGBO(0, 0, 0, 0.05),
        )
      ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ratings & Reviews",
                style: descriptionText(),
              ),
              // Icon(
              //   Icons.arrow_forward_ios,
              //   size: 15,
              //   color: kAppIcon,
              // ),
            ],
          ),
          const Divider(height: 25),
          // getVerticalSpace(15),
          ...List.generate(
            reivewText.length,
            (index) => Column(
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "${reivewText[index]['name']} - ",
                        style: descriptionText(),
                        children: [
                          TextSpan(
                            text: reivewText[index]['time'],
                            style: descriptionText(),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      unratedColor: kAppIcon,
                      itemCount: 5,
                      itemSize: 14,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: kStar,
                      ),
                      onRatingUpdate: (rating) => print(rating),
                    ),
                  ],
                ),
                getVerticalSpace(10),
                Text(
                  reivewText[index]['comment'],
                  style: TextStyle(
                    fontSize: getTextSize(12),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                    height: 1.8,
                  ),
                ),
                if (index + 1 < reivewText.length)
                  Divider(
                    height: getScreenHeight(45),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
