// To parse this JSON data, do
//
//     final FilmModel = FilmModelFromJson(jsonString);

import 'dart:convert';

// ignore: non_constant_identifier_names
FilmModel FilmModelFromJson(String str) => FilmModel.fromJson(json.decode(str));

class FilmModel {
  FilmModel({
    required this.count,
    required this.results,
  });

  final int count;

  final List<Result>? results;

  factory FilmModel.fromJson(Map<String, dynamic> json) => FilmModel(
        count: json["count"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    required this.created,
    required this.edited,
    required this.url,
  });

  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final DateTime? releaseDate;
  final List<String>? characters;
  final List<String>? planets;
  final List<String>? starships;
  final List<String>? vehicles;
  final List<String>? species;
  final DateTime? created;
  final DateTime? edited;
  final String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        episodeId: json["episode_id"],
        openingCrawl: json["opening_crawl"],
        director: json["director"],
        producer: json["producer"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        characters: json["characters"] == null
            ? null
            : List<String>.from(json["characters"].map((x) => x)),
        planets: json["planets"] == null
            ? null
            : List<String>.from(json["planets"].map((x) => x)),
        starships: json["starships"] == null
            ? null
            : List<String>.from(json["starships"].map((x) => x)),
        vehicles: json["vehicles"] == null
            ? null
            : List<String>.from(json["vehicles"].map((x) => x)),
        species: json["species"] == null
            ? null
            : List<String>.from(json["species"].map((x) => x)),
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"],
      );
}
