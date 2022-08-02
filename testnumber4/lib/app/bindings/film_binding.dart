
import 'package:get/get.dart';
import '../controllers/film_controller.dart';


class FilmBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilmController>(() => FilmController());
  }
}