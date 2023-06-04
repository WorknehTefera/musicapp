//import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopmusicDetil extends StatefulWidget {
  //const TopmusicDetil({super.key});
  final String title;
  final String name;
  final String image;
  final String preview;
  TopmusicDetil(this.title, this.name, this.image, this.preview);

  @override
  State<TopmusicDetil> createState() => _TopmusicDetilState();
}

class _TopmusicDetilState extends State<TopmusicDetil> {
  bool isPlaying = true;
  double value = 0;
  final player = AudioPlayer();
  Duration? duration = Duration(seconds: 0);
  void initPlayer() async {
    print(widget.preview);
    await player.setSourceUrl(widget.preview);
    //await player.setSource(AssetSource(widget.preview));
    //  await player.setSource(AssetSource("music.mp3"));

    duration = await player.getDuration();
    await player.resume();
  }

  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d2e37),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              setState(() {
                player.pause();
              });
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Color(0xFF2d2e37),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 300,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(widget.image), fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white, fontFamily: "Poppins", fontSize: 30),
            ),
            Text(
              widget.name,
              style: TextStyle(
                  color: Colors.white, fontFamily: "Poppins", fontSize: 15),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${(value / 60).floor()}: ${(value % 60).floor()}",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Poppins", fontSize: 15),
                ),
                Slider.adaptive(
                  onChanged: (v) {
                    setState(() {
                      value = v;
                    });
                  },
                  min: 0.0,
                  max: duration!.inSeconds.toDouble(),
                  value: value,
                  onChangeEnd: (newValue) async {
                    setState(() {
                      value = newValue;
                      print(newValue);
                    });
                    player.pause();
                    await player.seek(Duration(seconds: newValue.toInt()));
                    await player.resume();
                  },
                  activeColor: Colors.white,
                ),
                Text(
                  "${duration!.inMinutes}:${duration!.inSeconds % 60}",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Poppins", fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 155),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black45),
                      ),
                      child: InkWell(
                        onTap: () async {
                          if (isPlaying) {
                            await player.pause();
                            setState(() {
                              isPlaying = false;
                            });
                          } else {
                            await player.resume();
                            setState(() {
                              isPlaying = true;
                            });

                            player.onPositionChanged.listen(
                              (position) {
                                setState(() {
                                  value = position.inSeconds.toDouble();
                                });
                              },
                            );
                          }
                        },
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
