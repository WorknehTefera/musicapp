// To parse this JSON data, do
//
//     final listofTrackModel = listofTrackModelFromMap(jsonString);

import 'dart:convert';

ListofTrackModel listofTrackModelFromMap(String str) =>
    ListofTrackModel.fromMap(json.decode(str));

String listofTrackModelToMap(ListofTrackModel data) =>
    json.encode(data.toMap());

class ListofTrackModel {
  List<Datum> data;
  int total;
  String next;

  ListofTrackModel({
    required this.data,
    required this.total,
    required this.next,
  });

  factory ListofTrackModel.fromMap(Map<String, dynamic> json) =>
      ListofTrackModel(
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
  bool readable;
  String title;
  String titleShort;
  String titleVersion;
  String isrc;
  String link;
  int duration;
  int trackPosition;
  int diskNumber;
  int rank;
  bool explicitLyrics;
  int explicitContentLyrics;
  int explicitContentCover;
  String preview;
  String md5Image;
  Artist artist;
  String type;

  Datum({
    required this.id,
    required this.readable,
    required this.title,
    required this.titleShort,
    required this.titleVersion,
    required this.isrc,
    required this.link,
    required this.duration,
    required this.trackPosition,
    required this.diskNumber,
    required this.rank,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.preview,
    required this.md5Image,
    required this.artist,
    required this.type,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        readable: json["readable"],
        title: json["title"],
        titleShort: json["title_short"],
        titleVersion: json["title_version"],
        isrc: json["isrc"],
        link: json["link"],
        duration: json["duration"],
        trackPosition: json["track_position"],
        diskNumber: json["disk_number"],
        rank: json["rank"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        preview: json["preview"],
        md5Image: json["md5_image"],
        artist: Artist.fromMap(json["artist"]),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "readable": readable,
        "title": title,
        "title_short": titleShort,
        "title_version": titleVersion,
        "isrc": isrc,
        "link": link,
        "duration": duration,
        "track_position": trackPosition,
        "disk_number": diskNumber,
        "rank": rank,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "preview": preview,
        "md5_image": md5Image,
        "artist": artist.toMap(),
        "type": type,
      };
}

class Artist {
  int id;
  String name;
  String tracklist;
  String type;

  Artist({
    required this.id,
    required this.name,
    required this.tracklist,
    required this.type,
  });

  factory Artist.fromMap(Map<String, dynamic> json) => Artist(
        id: json["id"],
        name: json["name"],
        tracklist: json["tracklist"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "tracklist": tracklist,
        "type": type,
      };
}
