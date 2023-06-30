import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text('Mase app'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image(
            image: NetworkImage(
              'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
            ),
          ),
        ),
      ),
    ),
  );
}

// TODO Change app name in the next files :
// app/src/main/kotlin/com/example/base/MainActivity.kt :: 1
// app/src/main/AndroidManifest.xml  :: 2 & 4
// app/src/debug/AndroidManifest.xml :: 2
// app/build.gradle  :: 47
