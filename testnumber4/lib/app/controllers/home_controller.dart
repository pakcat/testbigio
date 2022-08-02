import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testnumber4/app/data/models/film_m.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;
  List<Result> film = [];
  changeindex(int i) {
    index.value = i;
  }

  getfilm() async {
    var response = await http.get(Uri.parse("https://swapi.dev/api/films/"));
    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      var result = FilmModel.fromJson(databody);
      film = result.results!;

      update();
    }
  }
}
