// To parse this JSON data, do
//
//     final artistModel = artistModelFromMap(jsonString);

import 'dart:convert';

ArtistModel artistModelFromMap(String str) =>
    ArtistModel.fromMap(json.decode(str));

String artistModelToMap(ArtistModel data) => json.encode(data.toMap());

class ArtistModel {
  List<Datum> data;
  int total;
  String next;

  ArtistModel({
    required this.data,
    required this.total,
    required this.next,
  });

  factory ArtistModel.fromMap(Map<String, dynamic> json) => ArtistModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        total: json["total"],
        next: json["next"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "total": total,
        "next": next,
      };
}

class Datum {
  int id;
  String title;
  String link;
  String cover;
  String coverSmall;
  String coverMedium;
  String coverBig;
  String coverXl;
  String md5Image;
  int genreId;
  int fans;
  DateTime releaseDate;
  String recordType;
  String tracklist;
  bool explicitLyrics;
  String type;

  Datum({
    required this.id,
    required this.title,
    required this.link,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.md5Image,
    required this.genreId,
    required this.fans,
    required this.releaseDate,
    required this.recordType,
    required this.tracklist,
    required this.explicitLyrics,
    required this.type,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        link: json["link"],
        cover: json["cover"],
        coverSmall: json["cover_small"],
        coverMedium: json["cover_medium"],
        coverBig: json["cover_big"],
        coverXl: json["cover_xl"],
        md5Image: json["md5_image"],
        genreId: json["genre_id"],
        fans: json["fans"],
        releaseDate: DateTime.parse(json["release_date"]),
        recordType: json["record_type"],
        tracklist: json["tracklist"],
        explicitLyrics: json["explicit_lyrics"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "link": link,
        "cover": cover,
        "cover_small": coverSmall,
        "cover_medium": coverMedium,
        "cover_big": coverBig,
        "cover_xl": coverXl,
        "md5_image": md5Image,
        "genre_id": genreId,
        "fans": fans,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "record_type": recordType,
        "tracklist": tracklist,
        "explicit_lyrics": explicitLyrics,
        "type": type,
      };
}
