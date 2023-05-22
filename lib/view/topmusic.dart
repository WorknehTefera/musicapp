import 'package:flutter/material.dart';

class TopMusicDetil extends StatelessWidget {
  // const TopMusicDetil({super.key});
  final String title;
  TopMusicDetil(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(this.title),
      ),
    );
  }
}
