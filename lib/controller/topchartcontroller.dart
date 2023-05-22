import 'dart:convert';
//import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/albummodel.dart';
import '../model/topchartmodel.dart';
//import 'package:testingapi/model/albummodel.dart';
//import '../model/model.dart';

class OpenController extends GetxController {
  var isloading = false.obs;
  Model? openmodel;
  AlbumModel? albummodel;
  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isloading(true);
      var response = await http.get(Uri.parse("https://api.deezer.com/chart"));
      var albumlist =
          await http.get(Uri.parse("https://api.deezer.com/album/302127"));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        var result2 = jsonDecode(albumlist.body);
        print(albumlist.body);
        albummodel = AlbumModel.fromMap(result2);
        openmodel = Model.fromMap(result);
        // openmodel = Model.fromJson(result);
      } else {
        print("feticng error");
      }
    } catch (e) {
      print("error while fetching");
    } finally {
      isloading(false);
    }
  }
}
