import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  void _getPath() async {
    final output = await getExternalStorageDirectory();
    final output2 = await getApplicationDocumentsDirectory();
    final output3 = await getApplicationSupportDirectory();
    final output4 = await getTemporaryDirectory();
    print('getExternalStorageDirectory = $output');
    print('getApplicationDocumentsDirectory = $output2');
    print('getApplicationSupportDirectory = $output3');
    print('getTemporaryDirectory = $output4');

  }

  void testImageProcessing() {
  //808, 527,894,613
    //width: 1080, height: 2248
    Img.Image testImage = Img.decodePng(File('/storage/emulated/0/Android/data/com.example.flutter_image_package_learn/files/test_image.png').readAsBytesSync());
//    Img.Image thumbnail = Img.copyResize(testImage, width: 120);
    final width = testImage.width;
    final height = testImage.height;
    print('width: $width, height: $height');
    Img.Image thumbnail = Img.copyCrop(testImage, 0, 527, 300, 500);
    File('/storage/emulated/0/Android/data/com.example.flutter_image_package_learn/files/thumbnail-test.png').writeAsBytesSync(Img.encodePng(thumbnail));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New_Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('New_Project'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
//            _getPath();
            testImageProcessing();
          },
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}



