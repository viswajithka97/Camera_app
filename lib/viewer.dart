import 'dart:io';

import 'package:camera/db/db_functions.dart';
import 'package:camera/media.dart';
import 'package:flutter/material.dart';

class Viewer extends StatelessWidget {
  // Viewer({Key? key}) : super(key: key);
  String? img;
  var index;
  Viewer({required this.img, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: Image(image: FileImage(File(img!))),
              ),
              IconButton(
                  onPressed: () {
                    deleteImage(index, context);
                  },
                  icon: Icon(Icons.delete))
            ]),
      ),
    );
  }
}
