import 'package:get/route_manager.dart';
import 'package:gojek_duplicate/app/core/utils.dart';
import 'package:gojek_duplicate/features/presentation/pages/home/home_page.dart';
import 'package:gojek_duplicate/features/presentation/pages/login/login_page.dart';
import 'package:gojek_duplicate/features/presentation/pages/search/search_page.dart';

class Navigation {
  static final appPages = [
    GetPage(
        name: Routes.loginPage,
        page: () => const LoginPage(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.homePage,
        page: () => const HomePage(),
        transition: Transition.cupertino),
    GetPage(name: Routes.searchPage, page: () => const SearchPage())
  ];
}
