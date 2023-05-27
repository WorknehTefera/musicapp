import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:musicapps/model/searchmodel.dart';

class SearchController extends GetxController {
  final storage = const FlutterSecureStorage();
  var isload = false.obs;
  SearchModel? searchModel;
  Future<void> OnInit() async {
    super.onInit();
    searchData();
  }

  searchData() async {
    try {
      isload(true);
      var a = storage.read(key: "data");
      print(a);
      var searchresponse =
          await http.get(Uri.parse("https://api.deezer.com/search?q=$a"));
      if (searchresponse.statusCode == 200) {
        var searchresult = jsonDecode(searchresponse.body);
        print(searchresult);
        searchModel = SearchModel.fromMap(searchresult);
      } else {
        print("feticng error");
      }
    } catch (e) {
      print("error while fetching");
    } finally {
      isload(false);
    }
  }
}
