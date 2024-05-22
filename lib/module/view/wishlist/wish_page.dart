import 'package:afc_assignment/constants/app_color.dart';
import 'package:afc_assignment/constants/assets_path.dart';
import 'package:afc_assignment/constants/size.dart';
import 'package:afc_assignment/module/controller/cart_controller.dart';
import 'package:afc_assignment/module/view/wishlist/components/wish_list.dart';
import 'package:afc_assignment/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WishPage extends StatelessWidget {
  const WishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cart = Get.find();
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            children: [
              const WishAppBar(),
              if (cart.wishList.isEmpty)
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        heartIcon,
                        color: kAppIcon,
                        height: 50,
                      ),
                      getVerticalSpace(10),
                      Text(
                        "Your Wish List Empty",
                        style: TextStyle(
                          letterSpacing: 0.71,
                          height: 1.5,
                          color: kAppIcon,
                          fontSize: getTextSize(18),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              else
                const WishList(),
            ],
          ),
        ),
      ),
    );
  }
}

class WishAppBar extends StatelessWidget {
  const WishAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarCard(
      childWidget: Row(
        children: [
          InkWell(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                backIcon,
                color: Colors.white,
              )),
          getHorizontalSpace(10),
          Text(
            "Wishlist",
            style: TextStyle(
              fontSize: getTextSize(18),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
