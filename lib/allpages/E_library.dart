import 'package:flutter/material.dart';

class ELibrary extends StatefulWidget {
  const ELibrary({super.key});

  @override
  State<ELibrary> createState() => _ELibraryState();
}

class _ELibraryState extends State<ELibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
      ),
    );
  }
}
