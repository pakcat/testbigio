// To parse this JSON data, do
//
//     final starshipModel = starshipModelFromJson(jsonString);

import 'dart:convert';

StarshipModel starshipModelFromJson(String str) =>
    StarshipModel.fromJson(json.decode(str));

class StarshipModel {
  StarshipModel({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
    required this.hyperdriveRating,
    required this.mglt,
    required this.starshipClass,
    required this.pilots,
    required this.films,
    required this.created,
    required this.edited,
    required this.url,
  });

  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String consumables;
  final String hyperdriveRating;
  final String mglt;
  final String starshipClass;
  final List<dynamic>? pilots;
  final List<String>? films;
  final DateTime? created;
  final DateTime? edited;
  final String url;

  factory StarshipModel.fromJson(Map<String, dynamic> json) => StarshipModel(
        name: json["name"],
        model: json["model"] ?? "",
        manufacturer: json["manufacturer"],
        costInCredits: json["cost_in_credits"],
        length: json["length"],
        maxAtmospheringSpeed: json["max_atmosphering_speed"],
        crew: json["crew"],
        passengers: json["passengers"],
        cargoCapacity: json["cargo_capacity"],
        consumables: json["consumables"],
        hyperdriveRating: json["hyperdrive_rating"],
        mglt: json["MGLT"],
        starshipClass: json["starship_class"],
        pilots: json["pilots"] == null
            ? null
            : List<dynamic>.from(json["pilots"].map((x) => x)),
        films: json["films"] == null
            ? null
            : List<String>.from(json["films"].map((x) => x)),
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"],
      );
}
