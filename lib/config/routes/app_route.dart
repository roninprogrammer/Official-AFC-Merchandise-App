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

  static const String splashPage = "/splash";
  static const String landingPage = "/landing";
  static const String loginPage = "/login";
  static const String registerPage = "/register";
  static const String productPage = "/product";
  static const String detailsPage = "/details";
  static const String wishPage = "/wish";
  static const String addressPage = "/billing";
  static const String aboutPage = "/about";
  static const String conditionPage = "/condition";
  static const String orderPage = "/order";
  static const String searchPage = "/search";

  static List<GetPage> getPage = [
    GetPage(name: splashPage, page: () => const SplashPage()),
    GetPage(name: landingPage, page: () => const LandingPage()),
    GetPage(name: loginPage, page: () => const LoginPage()),
    GetPage(name: registerPage, page: () => const RegisterPage()),
    GetPage(name: productPage, page: () => const ProductPage()),
    GetPage(name: detailsPage, page: () => const ProductDetails()),
    GetPage(name: wishPage, page: () => const WishPage()),
    GetPage(name: addressPage, page: () => const BillingAddress()),
    GetPage(name: aboutPage, page: () => const AboutPage()),
    GetPage(name: conditionPage, page: () => const ConditionsPage()),
    GetPage(name: orderPage, page: () => const MyOrderPage()),
    GetPage(name: searchPage, page: () => const SearchResultPage()),
  ];
}
