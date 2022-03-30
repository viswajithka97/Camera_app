import 'dart:io';

import 'package:camera/db/db_functions.dart';
import 'package:camera/media.dart';
import 'package:camera/viewer.dart';
import 'package:flutter/material.dart';

class Gridviewr extends StatelessWidget {
  const Gridviewr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: ValueListenableBuilder(
                valueListenable: ImageNotifier,
                builder:
                    (BuildContext ctx, List<Media> medialist, Widget? child) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 2),
                    itemBuilder: (ctx, index) {
                      var data = medialist[index];
                      return GestureDetector(
                        child: Container(
                          child: Image(
                              fit: BoxFit.fill,
                              image: FileImage(File(data.image))),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: ((context) {
                            return Viewer(img: data.image, index: index);
                          })));
                        },
                      );
                    },
                    itemCount: medialist.length,
                  );
                })));
  }
}
