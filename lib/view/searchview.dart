import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:musicapps/controller/topchartcontroller.dart';

class SearchViewData extends StatefulWidget {
  const SearchViewData({super.key});

  @override
  State<SearchViewData> createState() => _SearchViewDataState();
}

class _SearchViewDataState extends State<SearchViewData> {
  SearchController searchController = Get.put(SearchController());
  TextEditingController searchTextcontroller = TextEditingController();

//  OpenController openController = Get.put(OpenController());
  final storage = const FlutterSecureStorage();
  // final String searcheddata = storage.read(key: "_storage");
  //var searchdata= await storage.read(key: "_searcheddata");
  //var searchdata=storage.read(key: "");
  @override
  void initState() {
    super.initState();
    searchTextcontroller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d2e37),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10, top: 10),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.2),
                        border: Border.all(
                          color: Color(0xFF2d2e37),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        autofocus: true,
                        controller: searchTextcontroller,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,

                        decoration: const InputDecoration(
                          //  suffix: IconButton(onPressed: () {

                          // },icon: Icon(Icons.search)),
                          //   enabledBorder: OutlineInputBorder(),
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),

                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              //       fontFamily: "Poppins",
                              fontSize: 18),
                          border: InputBorder.none,
                        ),
                        // onTap: () {
                        //  Get.to(SearchViewData());
                        //   },
                        // onChanged: (value) async {
                        //   Get.to(SearchViewData());
                        //   // await storage.write(
                        //   //     key: _searcheddata, value: value);
                        //   //print(value);
                        //   // Perform search functionality here
                        // },
                        // onChanged: (value) async {
                        //   //  print(value);
                        //  // SearchMusic(value);
                        //   //print(aa);
                        //   //searchTextcontroller = value.toString();
                        // },
                      ),
                    ),
                  ),
                  // Spacer(),
                  Icon(
                    Icons.notification_add,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SearchMusic(searchTextcontroller.text),
          ],
        ),
      ),
    );
  }

  SearchMusic(String search) {
    //searchData(search);
    //   print(searchTextcontroller.text);
    return Container(
      child: Text(
        search,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
