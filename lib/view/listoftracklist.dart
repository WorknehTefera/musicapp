//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:musicapps/view/bottomnavigation.dart';
import 'package:musicapps/view/topmusic.dart';
//import 'package:http/http.dart';

import '../controller/topchartcontroller.dart';
import 'searchview.dart';

class ListOfTrackList extends StatefulWidget {
  //const ListOfTrackList({super.key});
  final ids;
  final String musiccover;
  final albumname;
  final tracklist;
  ListOfTrackList(this.ids, this.musiccover, this.albumname, this.tracklist);

  @override
  State<ListOfTrackList> createState() => _ListOfTrackListState();
}

class _ListOfTrackListState extends State<ListOfTrackList> {
  OpenController openController = Get.put(OpenController());
  //var aa = openController.ListData(widget.tracklist);
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     openController.ListData(widget.tracklist);
  //   });
  //   // print(widget.tracklist);
  // }

  // final storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => openController.isloading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              backgroundColor: Color(0xFF2d2e37),
              appBar: AppBar(
                title: Text(widget.albumname),
                backgroundColor: Color(0xFF2d2e37),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  // color: Colors.white,
                  child: GridView.builder(
                    itemCount:
                        openController.listoftrackmodel?.data.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //maxCrossAxisExtent: 200,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,

                      // childAspectRatio: 0,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF2d2e37),
                        ),
                        child: Column(
                          children: [
                            //Spacer(),
                            Container(
                              height: 100,
                              width: 150,

                              child: Column(
                                children: [
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 100, bottom: 5),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(180),
                                          color: Colors.white),
                                      child: IconButton(
                                        onPressed: () {
                                          Get.to(() => TopmusicDetil(
                                              openController.listoftrackmodel!
                                                  .data[index].title,
                                              "dunk",
                                              widget.musiccover,
                                              openController.listoftrackmodel!
                                                  .data[index].preview));
                                        },
                                        icon: Icon(Icons.play_arrow),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //   width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),

                                //color: Colors.amber,
                                image: DecorationImage(
                                  image: NetworkImage(widget.musiccover),
                                  //  .albummodel!.tracks.data![index].album.cover),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              //color: Colors.amber,
                            ),

                            Text(
                              openController
                                  .listoftrackmodel!.data[index].title,
                              // openController.listoftrackmodel!.data[index].title
                              //     .toString(),
                              //openController.albummodel!.title,
                              // openController
                              //     .listoftrackmodel!.data[index].diskNumber
                              //     .toString(),
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Poppins"),
                              overflow: TextOverflow.visible,
                            ),
                            //Spacer(),
                            // Container(
                            //   height: 40,
                            //   width: 40,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(180),
                            //       color: Colors.white),
                            //   child: IconButton(
                            //     onPressed: () {},
                            //     icon: Icon(Icons.play_arrow),
                            //     color: Color(0xFF2d2e37),
                            //   ),
                            // )
                          ],
                        ),
                      );
                    },
                    /* body: Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        // color: Colors.amber,
                        child: ListView.separated(
                          itemCount: openController.listoftrackmodel?.data.length ?? 0,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              // onTap: () async {
                              //   openController.ListData(
                              //       openController.artistmodel1!.data[index].tracklist);
                              //   // await storage.write(
                              //   //     key: 'tracklisturl',
                              //   //     value: openController.artistmodel1!.data[index].tracklist);
                              //   Get.to(ListOfTrackList());
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
                                            borderRadius: BorderRadius.circular(10),
                                            //color: Colors.amber,
                                            image: DecorationImage(
                                              image: NetworkImage(widget.musiccover),
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
                                                  openController.listoftrackmodel!
                                                      .data[index].title,
                                                  // .albummodel?.tracks.data![index].title ??
                                                  //"no data",
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
                                                  "daft Punk",
                                                  //openController.artistmodel1?.data[index].
                                                  // openController.artistmodel1.data[index].
                                                  //"daft Punk",
                                                  //openController.albummodel?.tracks.data[index]
                                                  //      .artist.name ??
                                                  // "no data",
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
                                  )),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),*/
                  ),
                ),
              ),
            ),
    );
  }
}
