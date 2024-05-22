import 'package:afc_assignment/constants/size.dart';
import 'package:afc_assignment/module/controller/app_controller.dart';
import 'package:afc_assignment/module/controller/data_controller.dart';
import 'package:afc_assignment/widgets/header_text.dart';
import 'package:afc_assignment/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommenedProduct extends StatelessWidget {
  const RecommenedProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController dataCtrl = Get.find();
    AppController appCtrl = Get.find();
    return SizedBox(
      child: Column(
        children: [
          const HeaderText(
            text: 'Recommended Product',
            press: true,
          ),
          getVerticalSpace(15),
          SizedBox(
            height: getScreenHeight(260),
            width: double.infinity,
            child: ListView.builder(
                controller: appCtrl.detailsPageScrollCtrl,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  final item = dataCtrl.productData.value.products![index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: ProductItem(
                      item: item,
                      widthSize: 140,
                      press: () {
                        appCtrl.detailPageScroll();
                      },
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
