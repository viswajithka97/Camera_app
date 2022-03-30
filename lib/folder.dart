import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

saveToFolder() async {
  Directory? directory;
  try {
    if (Platform.isAndroid) {
      if (await _requestPermission(Permission.storage)) {

        directory = await getExternalStorageDirectory();

        print(directory);

        String newPath = "";

        List<String> paths = directory!.path.split("/");

        for (int x = 1; x < paths.length; x++) {

          String folder = paths[x];

          if (folder != "data") {
            
            newPath += "/" + folder;
            
          } else {
            break;
          }
        }
        newPath = newPath + "/Canera";
        directory = Directory(newPath);
        return newPath;
      } else {
        return false;
      }
    }
  } catch (e) {

  }
}

Future<bool> _requestPermission(Permission permission) async {
  if (await permission.isGranted ) {
    return true;
  } else {
    var result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}
