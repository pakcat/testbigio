import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testnumber4/app/data/models/planetsearch_m.dart';

import '../data/models/peoplesearch_m.dart';

class SearchController extends GetxController {
  List<ResultPlanet>? resultplanet;
  List<ResultPeople>? resultpeople;
  searchplanet(String word) async {
    var response = await http
        .get(Uri.parse("https://swapi.dev/api/planets/?search=$word"));
    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      var result = PlanetSearchModel.fromJson(databody);
      resultplanet = result.results;
      searchpeople(word);
      update();
    }
  }

  searchpeople(String word) async {
    var response =
        await http.get(Uri.parse("https://swapi.dev/api/people/?search=$word"));
    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      var result = PeopleSearchModel.fromJson(databody);
      resultpeople = result.results;
      update();
    }
  }
}
