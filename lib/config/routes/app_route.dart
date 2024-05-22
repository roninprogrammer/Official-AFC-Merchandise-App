import 'package:afc_assignment/core/auth/login.dart';
import 'package:afc_assignment/core/auth/register.dart';
import 'package:afc_assignment/module/view/about_&_conditions/about.dart';
import 'package:afc_assignment/module/view/about_&_conditions/conditions.dart';
import 'package:afc_assignment/module/view/cart/components/billing_address.dart';
import 'package:afc_assignment/module/view/intro/landing_page.dart';
import 'package:afc_assignment/module/view/order/order_screen.dart';
import 'package:afc_assignment/module/view/prodcut_details/details_page.dart';
import 'package:afc_assignment/module/view/products/products.dart';
import 'package:afc_assignment/module/view/intro/splash.dart';
import 'package:afc_assignment/module/view/wishlist/wish_page.dart';
import 'package:afc_assignment/widgets/search_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  AppRoute._();
  static final AppRoute _instance = AppRoute._();
  static AppRoute get instance => _instance;

  static final String splashPage = "/splash";
  static final String landingPage = "/landing";
  static final String loginPage = "/login";
  static final String registerPage = "/register";
  static final String productPage = "/product";
  static final String detailsPage = "/details";
  static final String wishPage = "/wish";
  static final String addressPage = "/billing";
  static final String aboutPage = "/about";
  static final String conditionPage = "/condition";
  static final String orderPage = "/order";
  static final String searchPage = "/search";

  static List<GetPage> getPage = [
    GetPage(name: splashPage, page: () => SplashPage()),
    GetPage(name: landingPage, page: () => LandingPage()),
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: registerPage, page: () => RegisterPage()),
    GetPage(name: productPage, page: () => ProductPage()),
    GetPage(name: detailsPage, page: () => ProductDetails()),
    GetPage(name: wishPage, page: () => WishPage()),
    GetPage(name: addressPage, page: () => BillingAddress()),
    GetPage(name: aboutPage, page: () => AboutPage()),
    GetPage(name: conditionPage, page: () => ConditionsPage()),
    GetPage(name: orderPage, page: () => MyOrderPage()),
    GetPage(name: searchPage, page: () => SearchResultPage()),
  ];
}
