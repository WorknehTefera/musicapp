import 'package:flutter/material.dart';

class FavoriteMusic extends StatefulWidget {
  const FavoriteMusic({super.key});

  @override
  State<FavoriteMusic> createState() => _FavoriteMusicState();
}

class _FavoriteMusicState extends State<FavoriteMusic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("search"),
      ),
    );
  }
}
