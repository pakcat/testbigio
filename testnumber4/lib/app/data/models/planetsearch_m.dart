// To parse this JSON data, do
//
//     final planetSearchModel = planetSearchModelFromJson(jsonString);

import 'dart:convert';

PlanetSearchModel planetSearchModelFromJson(String str) =>
    PlanetSearchModel.fromJson(json.decode(str));

class PlanetSearchModel {
  PlanetSearchModel({
    required this.count,
    required this.results,
  });

  final int count;

  final List<ResultPlanet>? results;

  factory PlanetSearchModel.fromJson(Map<String, dynamic> json) =>
      PlanetSearchModel(
        count: json["count"],
        results: json["results"] == null
            ? null
            : List<ResultPlanet>.from(
                json["results"].map((x) => ResultPlanet.fromJson(x))),
      );
}

class ResultPlanet {
  ResultPlanet({
    required this.name,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.diameter,
    required this.climate,
    required this.gravity,
    required this.terrain,
    required this.surfaceWater,
    required this.population,
    required this.residents,
    required this.films,
    required this.created,
    required this.edited,
    required this.url,
  });

  final String name;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final String surfaceWater;
  final String population;
  final List<String>? residents;
  final List<String>? films;
  final DateTime? created;
  final DateTime? edited;
  final String url;

  factory ResultPlanet.fromJson(Map<String, dynamic> json) => ResultPlanet(
        name: json["name"],
        rotationPeriod: json["rotation_period"],
        orbitalPeriod: json["orbital_period"],
        diameter: json["diameter"],
        climate: json["climate"],
        gravity: json["gravity"],
        terrain: json["terrain"],
        surfaceWater: json["surface_water"],
        population: json["population"],
        residents: json["residents"] == null
            ? null
            : List<String>.from(json["residents"].map((x) => x)),
        films: json["films"] == null
            ? null
            : List<String>.from(json["films"].map((x) => x)),
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"],
      );
}
