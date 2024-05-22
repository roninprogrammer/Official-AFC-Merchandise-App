import 'package:afc_assignment/constants/app_constants.dart';
import 'package:afc_assignment/module/controller/app_controller.dart';
import 'package:afc_assignment/module/controller/cart_controller.dart';
import 'package:afc_assignment/module/controller/data_controller.dart';
import 'package:afc_assignment/utils/helper/dialog.dart';
import 'package:afc_assignment/widgets/bottom_nav.dart';
import 'package:afc_assignment/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<DataController>();
    Get.find<CartController>();

    return WillPopScope(
      onWillPop: () async {
        DialogHelper.instance.showConfirmDialog();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          endDrawer: MenuDrawer(),
          endDrawerEnableOpenDragGesture: false,
          body: LayoutBuilder(
            builder: (ctx, constrains) {
              return SizedBox(
                height: constrains.maxHeight,
                child: GetBuilder<AppController>(
                  init: AppController(),
                  builder: (app) => PageView.builder(
                    itemCount: screenPages.length,
                    controller: app.appPageCtrl,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return screenPages[app.navBarIndex.value];
                    },
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: BottomNavBar(),
        ),
      ),
    );
  }
}
