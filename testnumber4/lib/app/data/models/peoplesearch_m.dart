// To parse this JSON data, do
//
//     final peopleSearchModel = peopleSearchModelFromJson(jsonString);

// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

PeopleSearchModel peopleSearchModelFromJson(String str) =>
    PeopleSearchModel.fromJson(json.decode(str));

class PeopleSearchModel {
  PeopleSearchModel({
    required this.count,
    required this.results,
  });

  final int count;

  final List<ResultPeople>? results;

  factory PeopleSearchModel.fromJson(Map<String, dynamic> json) =>
      PeopleSearchModel(
        count: json["count"],
        results: json["results"] == null
            ? null
            : List<ResultPeople>.from(
                json["results"].map((x) => ResultPeople.fromJson(x))),
      );
}

class ResultPeople {
  ResultPeople({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeworld;
  final List<String>? films;
  final List<String>? species;
  final List<dynamic>? vehicles;
  final List<dynamic>? starships;
  final DateTime? created;
  final DateTime? edited;
  final String url;

  factory ResultPeople.fromJson(Map<String, dynamic> json) => ResultPeople(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: json["gender"],
        homeworld: json["homeworld"],
        films: json["films"] == null
            ? null
            : List<String>.from(json["films"].map((x) => x)),
        species: json["species"] == null
            ? null
            : List<String>.from(json["species"].map((x) => x)),
        vehicles: json["vehicles"] == null
            ? null
            : List<dynamic>.from(json["vehicles"].map((x) => x)),
        starships: json["starships"] == null
            ? null
            : List<dynamic>.from(json["starships"].map((x) => x)),
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"],
      );
}
