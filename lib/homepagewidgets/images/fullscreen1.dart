// import 'package:flutter/material.dart';
//
// class Fullscreen extends StatelessWidget {
//   String tag="";
//   String img="";
//   Fullscreen({required this.img,required this.tag});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Hero(
//           tag: tag, // Same tag for smooth animation
//           child: Image.asset(img),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Fullscreen extends StatelessWidget {
  final String tag;
  final String img;

  const Fullscreen({Key? key, required this.tag, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: tag,
          child: Image.asset(img),
        ),
      ),
    );
  }
}
