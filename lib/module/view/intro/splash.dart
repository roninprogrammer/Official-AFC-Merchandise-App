import 'package:afc_assignment/config/routes/app_route.dart';
import 'package:afc_assignment/constants/assets_path.dart';
import 'package:afc_assignment/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(3.seconds, () => Get.offAndToNamed(AppRoute.landingPage));
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  splash,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Version: 1.0.0"),
            ),
          ],
        ),
      ),
    );
  }
}
