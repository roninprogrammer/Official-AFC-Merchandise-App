import 'package:afc_assignment/constants/app_color.dart';
import 'package:afc_assignment/constants/assets_path.dart';
import 'package:afc_assignment/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarCard extends StatelessWidget {
  const AppBarCard({
    Key? key,
    @required this.childWidget,
    this.color = kPrimary,
  }) : super(key: key);
  final Widget? childWidget;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: getScreenHeight(70),
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: childWidget,
    );
  }
}

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) {
        return InkWell(
          onTap: () => Scaffold.of(ctx).openEndDrawer(),
          child: SvgPicture.asset(menuIcon, color: Colors.white),
        );
      },
    );
  }
}
