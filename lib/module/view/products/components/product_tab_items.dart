import 'package:afc_assignment/config/routes/app_route.dart';
import 'package:afc_assignment/constants/app_text.dart';
import 'package:afc_assignment/module/controller/app_controller.dart';
import 'package:afc_assignment/module/controller/data_controller.dart';
import 'package:afc_assignment/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTabItems extends StatelessWidget {
  const ProductTabItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    DataController data = Get.find();
    return PageView.builder(
      itemCount: productTabs.length,
      controller: appCtrl.productPageCtrl,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GridView.builder(
          itemCount: data.productData.value.products!.length,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.69,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (ctx, index) {
            final item = data.productData.value.products![index];
            return ProductItem(
              item: item,
              press: () {
                Get.toNamed(AppRoute.detailsPage,
                    arguments: data.productData.value.products![index].id);
              },
            );
          },
        );
      },
    );
  }
}
