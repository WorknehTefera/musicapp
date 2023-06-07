import 'dart:convert';
//import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:musicapps/main.dart';
import 'package:musicapps/model/artistmodel.dart';
import 'package:musicapps/model/listofgenre.dart';
import 'package:musicapps/model/listofradiomodel.dart';
import 'package:musicapps/model/listoftrackmodel.dart';
//import 'package:musicapps/model/searchmodel.dart';

import '../model/albummodel.dart';
import '../model/topchartmodel.dart';
//import 'package:testingapi/model/albummodel.dart';
//import '../model/model.dart';

class OpenController extends GetxController {
  var isloading = false.obs;
  Model? openmodel;
  AlbumModel? albummodel;
  //SearchModel? searchmodel;
  ArtistModel? artistmodel1;
  var listmusic;
  ListofTrackModel? listoftrackmodel;
  ListOfRadioModel? listofradiomodel;
  ListOfGenreModel? listofgenremodel;
  final storage = const FlutterSecureStorage();
  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();

    ListData(listmusic);
    //searchData();
  }

  fetchData() async {
    try {
      //var tracklisturl = await storage.read(key: "tracklisturl");
      // print("$tracklisturl");
      // var searchdata = 'digital love';
      isloading(true);
      var response = await http.get(Uri.parse("https://api.deezer.com/chart"));
      var albumlist =
          await http.get(Uri.parse("https://api.deezer.com/album/302127"));
      var artistlist1 =
          await http.get(Uri.parse("https://api.deezer.com/artist/27/albums"));
      var radiolistresponse =
          await http.get(Uri.parse("https://api.deezer.com/radio"));
      var genreresponse =
          await http.get(Uri.parse("https://api.deezer.com/genre/0/artists"));
      //print(genreresponse.body);
      if (response.statusCode == 200 ||
          albumlist.statusCode == 200 ||
          artistlist1.statusCode == 200 ||
          radiolistresponse.statusCode == 200 ||
          genreresponse.statusCode == 200) {
        var result = jsonDecode(response.body);
        var result2 = jsonDecode(albumlist.body);
        var artistresult = jsonDecode(artistlist1.body);
        var radioresult = jsonDecode(radiolistresponse.body);
        var genreresult = jsonDecode(genreresponse.body);
        albummodel = AlbumModel.fromMap(result2);
        openmodel = Model.fromMap(result);
        artistmodel1 = ArtistModel.fromMap(artistresult);
        listofradiomodel = ListOfRadioModel.fromMap(radioresult);
        listofgenremodel = ListOfGenreModel.fromMap(genreresult);
        // searchmodel = SearchModel.fromMap(searchresult);
        //print(searchmodel!.total.toString());
        // openmodel = Model.fromJson(result);
      } else {
        print("feticng error");
      }
    } catch (e) {
      print(e);
    } finally {
      isloading(false);
    }
  }

  ListData(var listmusic) async {
    try {
      isloading(true);
      var listoftrackresponse = await http.get(Uri.parse("$listmusic"));
      print(listoftrackresponse.body);
      if (listoftrackresponse.statusCode == 200) {
        var listoftrackresult = jsonDecode(listoftrackresponse.body);
        listoftrackmodel = ListofTrackModel.fromMap(listoftrackresult);
        //print(listoftrackresponse.body);
      }
    } catch (e) {
      // MyApp.ListOfmusic();
      //MyApp.ListOfArtist();
      print(e);
    } finally {
      isloading(false);
    }
  }
}
