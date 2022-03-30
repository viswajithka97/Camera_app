import 'package:camera/folder.dart';
import 'package:camera/home.dart';
import 'package:camera/media.dart';
import 'package:camera/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = await saveToFolder();
  
  await Hive.initFlutter(path);
  if (!Hive.isAdapterRegistered(MediaAdapter().typeId)) {
    Hive.registerAdapter(MediaAdapter());
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: SplashPage());
  }
}
