import 'package:flutter/material.dart';

class Fullscreen extends StatelessWidget {
  String tag="";
  String img="";
  Fullscreen({required this.img,required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: tag, // Same tag for smooth animation
          child: Image.asset(img),
        ),
      ),
    );
  }
}
