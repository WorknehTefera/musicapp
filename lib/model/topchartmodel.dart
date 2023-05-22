// To parse this JSON data, do
//
//     final model = modelFromMap(jsonString);

import 'dart:convert';

Model modelFromMap(String str) => Model.fromMap(json.decode(str));

String modelToMap(Model data) => json.encode(data.toMap());

class Model {
  Tracks tracks;
  Albums albums;
  Artists artists;
  Playlists playlists;
  Podcasts podcasts;

  Model({
    required this.tracks,
    required this.albums,
    required this.artists,
    required this.playlists,
    required this.podcasts,
  });

  factory Model.fromMap(Map<String, dynamic> json) => Model(
        tracks: Tracks.fromMap(json["tracks"]),
        albums: Albums.fromMap(json["albums"]),
        artists: Artists.fromMap(json["artists"]),
        playlists: Playlists.fromMap(json["playlists"]),
        podcasts: Podcasts.fromMap(json["podcasts"]),
      );

  Map<String, dynamic> toMap() => {
        "tracks": tracks.toMap(),
        "albums": albums.toMap(),
        "artists": artists.toMap(),
        "playlists": playlists.toMap(),
        "podcasts": podcasts.toMap(),
      };
}

class Albums {
  List<AlbumsDatum> data;
  int total;

  Albums({
    required this.data,
    required this.total,
  });

  factory Albums.fromMap(Map<String, dynamic> json) => Albums(
        data: List<AlbumsDatum>.from(
            json["data"].map((x) => AlbumsDatum.fromMap(x))),
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "total": total,
      };
}

class AlbumsDatum {
  int id;
  String title;
  String link;
  String cover;
  String coverSmall;
  String coverMedium;
  String coverBig;
  String coverXl;
  String md5Image;
  String recordType;
  String tracklist;
  bool explicitLyrics;
  int position;
  Artist artist;
  String type;

  AlbumsDatum({
    required this.id,
    required this.title,
    required this.link,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.md5Image,
    required this.recordType,
    required this.tracklist,
    required this.explicitLyrics,
    required this.position,
    required this.artist,
    required this.type,
  });

  factory AlbumsDatum.fromMap(Map<String, dynamic> json) => AlbumsDatum(
        id: json["id"],
        title: json["title"],
        link: json["link"],
        cover: json["cover"],
        coverSmall: json["cover_small"].toString(),
        coverMedium: json["cover_medium"].toString(),
        coverBig: json["cover_big"].toString(),
        coverXl: json["cover_xl"].toString(),
        md5Image: json["md5_image"].toString(),
        recordType: json["record_type"],
        tracklist: json["tracklist"],
        explicitLyrics: json["explicit_lyrics"],
        position: json["position"],
        artist: Artist.fromMap(json["artist"]),
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
        "record_type": recordType,
        "tracklist": tracklist,
        "explicit_lyrics": explicitLyrics,
        "position": position,
        "artist": artist.toMap(),
        "type": type,
      };
}

class Artist {
  int id;
  String name;
  String link;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  bool radio;
  String tracklist;
  String type;

  Artist({
    required this.id,
    required this.name,
    required this.link,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.radio,
    required this.tracklist,
    required this.type,
  });

  factory Artist.fromMap(Map<String, dynamic> json) => Artist(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        radio: json["radio"],
        tracklist: json["tracklist"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "link": link,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "radio": radio,
        "tracklist": tracklist,
        "type": type,
      };
}

class Artists {
  List<ArtistsDatum> data;
  int total;

  Artists({
    required this.data,
    required this.total,
  });

  factory Artists.fromMap(Map<String, dynamic> json) => Artists(
        data: List<ArtistsDatum>.from(
            json["data"].map((x) => ArtistsDatum.fromMap(x))),
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "total": total,
      };
}

class ArtistsDatum {
  int id;
  String name;
  String link;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  bool radio;
  String tracklist;
  int position;
  String type;

  ArtistsDatum({
    required this.id,
    required this.name,
    required this.link,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.radio,
    required this.tracklist,
    required this.position,
    required this.type,
  });

  factory ArtistsDatum.fromMap(Map<String, dynamic> json) => ArtistsDatum(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        radio: json["radio"],
        tracklist: json["tracklist"],
        position: json["position"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "link": link,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "radio": radio,
        "tracklist": tracklist,
        "position": position,
        "type": type,
      };
}

class Playlists {
  List<PlaylistsDatum> data;
  int total;

  Playlists({
    required this.data,
    required this.total,
  });

  factory Playlists.fromMap(Map<String, dynamic> json) => Playlists(
        data: List<PlaylistsDatum>.from(
            json["data"].map((x) => PlaylistsDatum.fromMap(x))),
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "total": total,
      };
}

class PlaylistsDatum {
  int id;
  String title;
  bool public;
  int nbTracks;
  String link;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  String checksum;
  String tracklist;
  String creationDate;
  String md5Image;
  String pictureType;
  User user;
  String type;

  PlaylistsDatum({
    required this.id,
    required this.title,
    required this.public,
    required this.nbTracks,
    required this.link,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.checksum,
    required this.tracklist,
    required this.creationDate,
    required this.md5Image,
    required this.pictureType,
    required this.user,
    required this.type,
  });

  factory PlaylistsDatum.fromMap(Map<String, dynamic> json) => PlaylistsDatum(
        id: json["id"],
        title: json["title"],
        public: json["public"],
        nbTracks: json["nb_tracks"],
        link: json["link"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        checksum: json["checksum"],
        tracklist: json["tracklist"],
        creationDate: json["creation_date"],
        md5Image: json["md5_image"],
        pictureType: json["picture_type"],
        user: User.fromMap(json["user"]),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "public": public,
        "nb_tracks": nbTracks,
        "link": link,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "checksum": checksum,
        "tracklist": tracklist,
        "creation_date": creationDate,
        "md5_image": md5Image,
        "picture_type": pictureType,
        "user": user.toMap(),
        "type": type,
      };
}

class User {
  int id;
  String name;
  String tracklist;
  String type;

  User({
    required this.id,
    required this.name,
    required this.tracklist,
    required this.type,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
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

class Podcasts {
  List<PodcastsDatum> data;
  int total;

  Podcasts({
    required this.data,
    required this.total,
  });

  factory Podcasts.fromMap(Map<String, dynamic> json) => Podcasts(
        data: List<PodcastsDatum>.from(
            json["data"].map((x) => PodcastsDatum.fromMap(x))),
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "total": total,
      };
}

class PodcastsDatum {
  int id;
  String title;
  String description;
  bool available;
  int fans;
  String link;
  String share;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  String type;

  PodcastsDatum({
    required this.id,
    required this.title,
    required this.description,
    required this.available,
    required this.fans,
    required this.link,
    required this.share,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.type,
  });

  factory PodcastsDatum.fromMap(Map<String, dynamic> json) => PodcastsDatum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        available: json["available"],
        fans: json["fans"],
        link: json["link"],
        share: json["share"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "available": available,
        "fans": fans,
        "link": link,
        "share": share,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "type": type,
      };
}

class Tracks {
  List<TracksDatum> data;
  int total;

  Tracks({
    required this.data,
    required this.total,
  });

  factory Tracks.fromMap(Map<String, dynamic> json) => Tracks(
        data: List<TracksDatum>.from(
            json["data"].map((x) => TracksDatum.fromMap(x))),
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "total": total,
      };
}

class TracksDatum {
  int id;
  String title;
  String titleShort;
  String titleVersion;
  String link;
  int duration;
  int rank;
  bool explicitLyrics;
  int explicitContentLyrics;
  int explicitContentCover;
  String preview;
  String md5Image;
  int position;
  Artist artist;
  Album album;
  String type;

  TracksDatum({
    required this.id,
    required this.title,
    required this.titleShort,
    required this.titleVersion,
    required this.link,
    required this.duration,
    required this.rank,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.preview,
    required this.md5Image,
    required this.position,
    required this.artist,
    required this.album,
    required this.type,
  });

  factory TracksDatum.fromMap(Map<String, dynamic> json) => TracksDatum(
        id: json["id"],
        title: json["title"],
        titleShort: json["title_short"],
        titleVersion: json["title_version"],
        link: json["link"],
        duration: json["duration"],
        rank: json["rank"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        preview: json["preview"],
        md5Image: json["md5_image"],
        position: json["position"],
        artist: Artist.fromMap(json["artist"]),
        album: Album.fromMap(json["album"]),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "title_short": titleShort,
        "title_version": titleVersion,
        "link": link,
        "duration": duration,
        "rank": rank,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "preview": preview,
        "md5_image": md5Image,
        "position": position,
        "artist": artist.toMap(),
        "album": album.toMap(),
        "type": type,
      };
}

class Album {
  int id;
  String title;
  String cover;
  String coverSmall;
  String coverMedium;
  String coverBig;
  String coverXl;
  String md5Image;
  String tracklist;
  String type;

  Album({
    required this.id,
    required this.title,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.md5Image,
    required this.tracklist,
    required this.type,
  });

  factory Album.fromMap(Map<String, dynamic> json) => Album(
        id: json["id"],
        title: json["title"],
        cover: json["cover"],
        coverSmall: json["cover_small"],
        coverMedium: json["cover_medium"],
        coverBig: json["cover_big"],
        coverXl: json["cover_xl"],
        md5Image: json["md5_image"],
        tracklist: json["tracklist"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "cover": cover,
        "cover_small": coverSmall,
        "cover_medium": coverMedium,
        "cover_big": coverBig,
        "cover_xl": coverXl,
        "md5_image": md5Image,
        "tracklist": tracklist,
        "type": type,
      };
}
