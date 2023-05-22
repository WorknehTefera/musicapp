//import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapps/view/topmusic.dart';

import 'controller/topchartcontroller.dart';
//import 'package:musicapps/test1.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  OpenController openController = Get.put(OpenController());
  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 4, vsync: this);
    return Scaffold(
      backgroundColor: Color(0xFF2d2e37),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2d2e37), Color(0xFF2d2e37)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(),
            hintText: 'Search any music you want',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            // Perform search functionality here
          },
        ),
        backgroundColor: Color(0xFF2d2e37),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Drawer header"),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Obx(() => openController.isloading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      //alignment: Alignment.centerLeft,
                      child: Text(
                        "Trending right now",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 230,
                    width: double.maxFinite,
                    // color: Colors.amber,
                    child: ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      scrollDirection: Axis.horizontal,
                      itemCount: openController.openmodel?.tracks.total,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            // color: Colors.white,
                            height: 240,
                            width: 250,
                            child: Column(
                              children: [
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    height: 70,
                                    width: 220,
                                    // color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    openController
                                                            .openmodel
                                                            ?.tracks
                                                            .data![index]
                                                            .artist
                                                            .name ??
                                                        'no name',
                                                    softWrap: false,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'poppins'),
                                                  ),
                                                  Text(
                                                    openController
                                                            .openmodel
                                                            ?.tracks
                                                            .data![index]
                                                            .title ??
                                                        'no title',
                                                    softWrap: false,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              Get.to(TopMusicDetil(
                                                openController.openmodel!.tracks
                                                    .data![index].title
                                                    .toString(),
                                              ));
                                            },
                                            icon: Icon(
                                              Icons.play_circle_fill,
                                              color: Colors.white,
                                              size: 50,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        //  boxShadow: ,
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color(0xFF3c3abe).withOpacity(0.9)),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: Colors.amber,
                                image: DecorationImage(
                                    image: NetworkImage(openController
                                        .openmodel!
                                        .tracks
                                        .data[index]
                                        .album
                                        .coverBig),
                                    fit: BoxFit.cover)
                                // color: Colors.amber,
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      // width: 50,
                      child: Align(
                        alignment: Alignment.center,
                        child: TabBar(
                            labelStyle: TextStyle(
                                fontFamily: "poppins",
                                //fontWeight: FontWeight.bold,
                                fontSize: 15),
                            controller: _tabcontroller,
                            labelColor: Colors.white,
                            isScrollable: true,
                            labelPadding:
                                const EdgeInsets.only(left: 20, right: 20),
                            unselectedLabelColor: Colors.white,
                            indicator: BoxDecoration(
                                border: Border.all(color: Color(0xFF3c3abe)),
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF3c3abe)),
                            tabs: [
                              Tab(
                                text: "Album",
                              ),
                              Tab(
                                text: "Album",
                              ),
                              Tab(
                                text: "Artist",
                              ),
                              Tab(
                                text: "Radio",
                              ),
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 400,
                    // color: Colors.amberAccent,
                    child: TabBarView(controller: _tabcontroller, children: [
                      ListView.separated(
                        itemCount: openController.albummodel?.nbTracks ?? 0,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
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
                                        borderRadius: BorderRadius.circular(10),
                                        //color: Colors.amber,
                                        image: DecorationImage(
                                          image: NetworkImage(openController
                                              .albummodel!
                                              .tracks
                                              .data![index]
                                              .album
                                              .cover),
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
                                              openController.albummodel?.tracks
                                                      .data![index].title ??
                                                  "no data",
                                              softWrap: false,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              openController
                                                      .albummodel
                                                      ?.tracks
                                                      .data![index]
                                                      .artist
                                                      .name ??
                                                  "no data",
                                              softWrap: false,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "Rubik"),
                                            )
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
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ),
                      Text("album"),
                      Text("artist"),
                      Text("radio"),
                    ]),
                  ),
                ],
              ),
            )),
    );
  }
}
