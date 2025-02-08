import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

class MyMap extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Example',
      home: FullScreenZoomableImage(),
    );
  }
}

class FullScreenZoomableImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:  Container(
              child: InteractiveViewer(
                panEnabled: true, // Allow panning
                minScale: 1.0, // Minimum scale
                maxScale: 4.0, // Maximum scale
                child: Image.asset(
                  'assets/images/map.jpg',height: 1400, // Replace with your image path
                  fit: BoxFit.cover, // Cover the entire screen
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}













// class PDFScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: PDFView(
//           filePath: 'assets/sample.pdf',
//           fitEachPage: true,
//           fitPolicy: FitPolicy.BOTH,
//         ),
//       ),
//     );
//   }
// }
