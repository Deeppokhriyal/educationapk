import 'package:flutter/material.dart';

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
      backgroundColor: Colors.black,
      body: InteractiveViewer(
        panEnabled: true, // Allow panning
        boundaryMargin: EdgeInsets.all(double.infinity), // Allow infinite panning
        minScale: 1.0, // Minimum zoom level
        maxScale: 20.0, // Maximum zoom level
        child: Center(
          child: Image.asset(
            'assets/images/map.png', // Replace with your image path
            width: MediaQuery.of(context).size.width, // Full width
            height: MediaQuery.of(context).size.height, // Full height
            fit: BoxFit.contain, // Ensure full-screen coverage
          ),
        ),
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
