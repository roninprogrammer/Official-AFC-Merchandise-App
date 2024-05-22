import 'package:afc_assignment/constants/assets_path.dart';
import 'package:afc_assignment/constants/size.dart';
import 'package:afc_assignment/module/controller/app_controller.dart';
import 'package:afc_assignment/widgets/action_icon.dart';
import 'package:afc_assignment/widgets/custom_app_bar.dart';
import 'package:afc_assignment/widgets/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/category_tab.dart';
import 'components/category_tab_items.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    return Column(children: [
      AppBarCard(
        childWidget: Row(
          children: [
            Text(
              "Category",
              style: TextStyle(
                fontSize: getTextSize(18),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            ActionIcon(
                icon: searchIcon,
                press: () =>
                    showSearch(context: context, delegate: CustomSearch())),
            getHorizontalSpace(15),
            ActionIcon(
                icon: cartIcon,
                visible: true,
                press: () {
                  appCtrl.changePage(2);
                }),
          ],
        ),
      ),
      const Expanded(
        child: Row(
          children: [
            CategoryTabs(),
            CategoryTabItems(),
          ],
        ),
      )
    ]);
  }
}
