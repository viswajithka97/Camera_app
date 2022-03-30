
import 'package:camera/camera.dart';
import 'package:camera/gallery.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/cymera-camera-selfie-app.jpg'),fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Spacer(),
            Container(
              child: GestureDetector(
                  onTap: () {
                    camera(context);
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 60,
                      ),Text('Camera',style: TextStyle(fontSize: 22,letterSpacing: 2,color: Colors.white),)
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Gridviewr()));
              },
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 65,
                  ),Text('Gallery',style:TextStyle(fontSize: 22,letterSpacing: 2,color: Colors.white) ,)
                ],
              ),
            )),
            Spacer(),
            Text(
              'Google Camera',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 9),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      )),
    );
  }
}
