import 'package:get/route_manager.dart';
import 'package:gojek_duplicate/app/core/utils.dart';
import 'package:gojek_duplicate/features/presentation/pages/search_page/search_page.dart';



class Navigation {
  static final appPages = [
    GetPage(name: Routes.searchPage, page: () => const SearchPage())
  ];
}
