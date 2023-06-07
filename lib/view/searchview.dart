import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:musicapps/view/bottomnavigation.dart';
//import 'package:musicapps/controller/searchcontroller.dart';
//import 'package:musicapps/controller/topchartcontroller.dart';

import '../controller/searchcontroller.dart';

class SearchViewData extends StatefulWidget {
  const SearchViewData({super.key});

  @override
  State<SearchViewData> createState() => _SearchViewDataState();
}

class _SearchViewDataState extends State<SearchViewData> {
  SearchControllers searchController = Get.put(SearchControllers());
  // SearchController searchController = Get.put(SearchController());
  TextEditingController searchTextcontroller = TextEditingController();

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => BottomNavigationBarPart());
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    Container(
                      height: 50,
                      width: 270,
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
                            // prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new)),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                //       fontFamily: "Poppins",
                                fontSize: 18),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchController
                                  .searchData(searchTextcontroller.text);
                              SearchMusic(searchTextcontroller.text);
                            });
                          },
                        ),
                      ),
                    ),
                    // Spacer(),
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
      ),
    );
  }

  SearchMusic(String search) {
    return Obx(
      () => searchController.isload.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : searchTextcontroller.text == ""
              ? Center(
                  child: Text(
                    "no result",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : searchController.searchModel?.data.length == 0
                  ? Center(
                      child: Text(
                        "no result found",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        height: 500,
                        width: double.maxFinite,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount:
                              searchController.searchModel?.data.length ?? 0,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              // onTap: () async {
                              //   openController.ListData(
                              //     openController.artistmodel1!.data[index].tracklist,
                              //   );
                              //   // await storage.write(
                              //   //     key: 'tracklisturl',
                              //   //     value: openController.artistmodel1!.data[index].tracklist);
                              //   Get.to(ListOfTrackList(
                              //       openController.artistmodel1!.data[index].coverBig,
                              //       openController.artistmodel1?.data[index].title));
                              // },
                              //   Get.to(TopmusicDetil(
                              //       openController.albummodel!.tracks.data![index].title,
                              //       openController.albummodel!.tracks.data![index].artist.name,
                              //       openController.albummodel!.tracks.data![index].album.cover,
                              //       openController.albummodel!.tracks.data![index].preview));
                              // },
                              child: Container(
                                  height: 80,
                                  color: Color(0xFF2d2e37),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            //color: Colors.amber,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  searchController
                                                      .searchModel!
                                                      .data[index]
                                                      .album
                                                      .coverBig),

                                              //  .albummodel!.tracks.data![index].album.cover),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          //color: Colors.amber,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  searchController.searchModel!
                                                      .data[index].title,
                                                  softWrap: false,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: "Poppins",
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 18),
                                                ),
                                                // Text(
                                                //   "daft Punk",
                                                //   //openController.artistmodel1?.data[index].
                                                //   // openController.artistmodel1.data[index].
                                                //   //"daft Punk",
                                                //   //openController.albummodel?.tracks.data[index]
                                                //   //      .artist.name ??
                                                //   // "no data",
                                                //   softWrap: false,
                                                //   maxLines: 1,
                                                //   overflow: TextOverflow.ellipsis,
                                                //   style: TextStyle(
                                                //       color: Colors.grey,
                                                //       fontFamily: "Rubik"),
                                                // )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      ),
                    ),
    );
  }
}
