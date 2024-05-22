import 'package:afc_assignment/config/routes/app_route.dart';
import 'package:afc_assignment/module/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/app_color.dart';
import '../constants/assets_path.dart';
import '../constants/size.dart';
import '../module/controller/app_controller.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    CartController cart = Get.find();
    return Drawer(
      child: Obx(
        () => ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    color: kPrimary,
                  ),
                  Positioned(
                    left: 25,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: getScreenHeight(30),
                            // width: getScreeWidth(55),
                            child: Text(
                              "Econix",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: getTextSize(30),
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        getVerticalSpace(10),
                        Text(
                          "Electronic Shop".capitalize!,
                          style: TextStyle(
                            fontSize: getTextSize(14),
                            fontWeight: FontWeight.bold,
                            color: kOffWhite,
                            letterSpacing: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DrawerItem(
              title: "Home",
              icon: homeIcon,
              press: () {
                if (appCtrl.navBarIndex.value == 0) {
                  Get.back();
                } else {
                  Get.back();
                  appCtrl.changePage(0);
                }
              },
            ),
            const Divider(indent: 10, endIndent: 10),
            DrawerItem(
                title: "Products",
                icon: productIcon,
                press: () {
                  Get.offAndToNamed(AppRoute.productPage);
                }),
            const Divider(indent: 10, endIndent: 10),
            DrawerItem(
                title: "My Orders",
                icon: orderBagIcon,
                press: () {
                  Get.offAndToNamed(AppRoute.orderPage);
                }),
            const Divider(indent: 10, endIndent: 10),
            DrawerItem(
                title: "Wishlist\t(${cart.wishList.length})",
                icon: heartIcon,
                press: () {
                  Get.offAndToNamed(AppRoute.wishPage);
                }),
            const Divider(indent: 10, endIndent: 10),
            DrawerItem(
              title: "About",
              icon: aboutIcon,
              press: () {
                Get.offAndToNamed(AppRoute.aboutPage);
              },
            ),
            const Divider(indent: 10, endIndent: 10),
            DrawerItem(
              title: "Terms & Conditions",
              icon: conditionsIcon,
              press: () {
                Get.offAndToNamed(AppRoute.conditionPage);
              },
            ),
            if (appCtrl.userExists.value)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(indent: 10, endIndent: 10),
                  DrawerItem(
                    title: "Sign Out",
                    icon: logoutIcon,
                    textColor: kRed,
                    press: () {
                      final box = GetStorage();
                      box.write('token', null);
                      box.write('id', null);
                      Get.back();
                      appCtrl.checkToken();
                    },
                  ),
                ],
              ),
            if (!appCtrl.userExists.value)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(indent: 10, endIndent: 10),
                  DrawerItem(
                    title: "LogIn",
                    icon: loginIcon,
                    textColor: Colors.green[600],
                    press: () {
                      Get.offAndToNamed(AppRoute.loginPage);
                    },
                  ),
                ],
              ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, this.title, this.press, this.icon, this.textColor = kDark});
  final String? title;
  final VoidCallback? press;
  final String? icon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: SvgPicture.asset(
        icon!,
        color: textColor,
        height: getScreeWidth(20),
        width: getScreeWidth(20),
      ),
      title: SizedBox(
        height: getScreenHeight(25),
        child: Text(title!,
            style: Get.textTheme.titleSmall!.copyWith(color: textColor)),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 10),
      onTap: press,
    );
  }
}
