// To parse this JSON data, do
//
//     final listOfRadioModel = listOfRadioModelFromMap(jsonString);

import 'dart:convert';

ListOfRadioModel listOfRadioModelFromMap(String str) =>
    ListOfRadioModel.fromMap(json.decode(str));

String listOfRadioModelToMap(ListOfRadioModel data) =>
    json.encode(data.toMap());

class ListOfRadioModel {
  List<Datum> data;

  ListOfRadioModel({
    required this.data,
  });

  factory ListOfRadioModel.fromMap(Map<String, dynamic> json) =>
      ListOfRadioModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  int id;
  String title;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  String tracklist;
  String md5Image;
  String type;

  Datum({
    required this.id,
    required this.title,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.tracklist,
    required this.md5Image,
    required this.type,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        tracklist: json["tracklist"],
        md5Image: json["md5_image"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "tracklist": tracklist,
        "md5_image": md5Image,
        "type": type,
      };
}
