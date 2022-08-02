import 'package:get/get.dart';
import 'package:testnumber4/app/bindings/film_binding.dart';
import 'package:testnumber4/app/ui/pages/film_page/film_page.dart';
import 'package:testnumber4/app/ui/pages/home_page/home_page.dart';

import 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
    GetPage(
        name: Routes.film, page: () => const FilmPage(), binding: FilmBinding())
  ];
}
