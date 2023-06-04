import 'dart:convert';
//import 'dart:ffi';

//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:musicapps/model/searchmodel.dart';

class SearchController extends GetxController {
//  final storage = const FlutterSecureStorage();
  var isload = false.obs;
  SearchModel? searchModel;
  var searchitem;
  Future<void> OnInit() async {
    super.onInit();
    searchData(searchitem);
  }

  searchData(var searchitem) async {
    try {
      isload(true);
      print(searchitem);
      var searchresponse = await http
          .get(Uri.parse("https://api.deezer.com/search?q=${searchitem}"));

      if (searchresponse.statusCode == 200) {
        var searchresult = jsonDecode(searchresponse.body);
        // print(searchresult);
        searchModel = SearchModel.fromMap(searchresult);
        print(searchModel);
        print(searchresult);
      } else {
        print("feticng error");
      }
    } catch (e) {
      print(e);
    } finally {
      isload(false);
    }
  }
}
