import 'dart:io';

import 'package:camera/folder.dart';
import 'package:camera/media.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<Media>> ImageNotifier = ValueNotifier([]);

int count =0;

Future<void> addImage(img) async {

  var path = await saveToFolder();

  var media = await Hive.openBox<Media>('imgBox');

  Media obj = Media(img);

  await media.add(obj);

  ImageNotifier.value.add(obj);

  ImageNotifier.notifyListeners();

  File(img).copy('$path/img$count.jpeg');

  count++;

}


Future<void> getAllImage() async {
  var media = await Hive.openBox<Media>('imgBox');
  ImageNotifier.value.clear();
  ImageNotifier.value.addAll(media.values);
  ImageNotifier.notifyListeners();
}


Future<void> deleteImage(index, context) async {
  var media = await Hive.openBox<Media>('imgBox');
  var key = media.keyAt(index);
  media.delete(key);

  getAllImage();
  Navigator.of(context).pop();
}
