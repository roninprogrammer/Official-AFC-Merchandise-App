import 'package:afc_assignment/config/routes/app_route.dart';
import 'package:afc_assignment/constants/app_color.dart';
import 'package:afc_assignment/constants/app_constants.dart';
import 'package:afc_assignment/constants/assets_path.dart';
import 'package:afc_assignment/constants/size.dart';
import 'package:afc_assignment/module/controller/app_controller.dart';
import 'package:afc_assignment/module/controller/auth_controller.dart';
import 'package:afc_assignment/utils/helper/show_snack.dart';
import 'package:afc_assignment/widgets/account_text.dart';
import 'package:afc_assignment/widgets/custom_button.dart';
import 'package:afc_assignment/widgets/heading_text.dart';
import 'package:afc_assignment/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthController auth;
  late AppController appCtrl;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  @override
  void initState() {
    super.initState();
    auth = Get.find();
    appCtrl = Get.find();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset(backIcon),
          onPressed: () => Get.back(),
        ),
        title: const Text("Account"),
        backgroundColor: kPrimary,
        elevation: 0.0,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            height: ResponsiveSize.screenHeight * 0.8,
            width: ResponsiveSize.screenWidth,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.15),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AuthHeadingText(text: "Sign In", fontSize: 30),
                        getVerticalSpace(30),
                        TextField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: buildCredentialDecoration(
                              hintText: "Email", icon: emailIcon),
                        ),
                        getVerticalSpace(25),
                        TextField(
                          controller: _pass,
                          obscureText: true,
                          decoration: buildCredentialDecoration(
                              hintText: "Password", icon: lockIcon),
                        ),
                        getVerticalSpace(10),
                        CheckboxListTile(
                            value: appCtrl.isRememberUer.value,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            title: const Text("Remember Me"),
                            onChanged: (v) {
                              appCtrl.isRememberUer(v);
                            }),
                        getVerticalSpace(30),
                        if (auth.isLoading.value)
                          const LoadingIndicator()
                        else
                          CustomButton(
                            text: "Log In Now",
                            widthValue: getScreeWidth(335),
                            press: _onLogin,
                          ),
                      ],
                    ),
                  ),
                ),
                getVerticalSpace(30),
                AccountText(
                  text: "Don’t Have An Account?",
                  authText: "Sign Up",
                  press: () {
                    Get.offAndToNamed(AppRoute.registerPage);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _onLogin() async {
    if (_email.text.isNotEmpty && _pass.text.isNotEmpty) {
      try {
        final result =
            await auth.userLogin(email: _email.text, pass: _pass.text);
        if (result) {
          appCtrl.changePage(0);
          Get.back();
        } else {
          SnackMessage.instance.showSnack(message: auth.errorMsg.value);
        }
      } on Exception catch (e) {
        SnackMessage.instance.showSnack(message: e.toString());
      }
    } else {
      print("Field are empty");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Field can't be empty")));
    }
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty<AppController>('appCtrl', appCtrl));
  // }
}
