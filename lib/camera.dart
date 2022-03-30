import 'dart:io';
import 'package:camera/db/db_functions.dart';
import 'package:image_picker/image_picker.dart';

var image;
var count;
Future<void> camera(context) async {

  final ImagePicker _picker = ImagePicker();
 // var path = await saveToFolder();
  XFile? photo = await _picker.pickImage(source: ImageSource.camera);

  if (photo != null) {

    image = File(photo.path);
  
    addImage(image.path);


  } else {
    return;
  }
}
