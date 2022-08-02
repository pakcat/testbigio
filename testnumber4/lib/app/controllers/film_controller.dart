import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testnumber4/app/data/models/chara_m.dart';
import 'package:testnumber4/app/data/models/filmdetail.dart';
import 'package:testnumber4/app/data/models/spesies_m.dart';
import 'package:testnumber4/app/data/models/starship_m.dart';
import 'package:testnumber4/app/data/models/vehicles_m.dart';

import '../data/models/planet_m.dart';

class FilmController extends GetxController {
  List<FilmDetailModel> film = [];
  List<String> characters = [];
  List<String> planets = [];
  List<String> starships = [];
  List<String> vehicles = [];
  List<String> species = [];
  String? chara;
  String planet = "";
  String starship = "";
  String vehicle = "";
  String spesis = "";

  getfilm(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      film.clear();
      characters.clear();
      var databody = jsonDecode(response.body);
      var result = FilmDetailModel.fromJson(databody);
      film.add(result);
      for (var i = 0; i < result.characters!.length; i++) {
        getcharacters(result.characters![i]);
      }
      for (var i = 0; i < result.planets!.length; i++) {
        getplanet(result.planets![i]);
      }
      for (var i = 0; i < result.starships!.length; i++) {
        getstarship(result.starships![i]);
      }
      for (var i = 0; i < result.vehicles!.length; i++) {
        getvehicles(result.vehicles![i]);
      }
      for (var i = 0; i < result.species!.length; i++) {
        getspesies(result.species![i]);
      }
      update();
    }
  }

  getcharacters(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      var result = CharaDetailModel.fromJson(databody);
      characters.add(result.name);

      update();
    }
  }

  getplanet(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      var result = PlanetDetailModel.fromJson(databody);
      planets.add(result.name);
      update();
    }
  }

  getstarship(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      var result = StarshipModel.fromJson(databody);
      starships.add(result.name);

      update();
    }
  }

  getvehicles(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      var result = VehiclesModel.fromJson(databody);
      vehicles.add(result.name);

      update();
    }
  }

  getspesies(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      var result = SpesiesModel.fromJson(databody);
      species.add(result.name);
      update();
    }
  }
}
