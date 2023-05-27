import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListOfTrackList extends StatefulWidget {
  //const ListOfTrackList({super.key});
  final String tracklistlink;
  ListOfTrackList(this.tracklistlink);

  @override
  State<ListOfTrackList> createState() => _ListOfTrackListState();
}

class _ListOfTrackListState extends State<ListOfTrackList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.tracklistlink)),
    );
  }
}
