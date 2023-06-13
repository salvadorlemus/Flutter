//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Center(child: Text("Im poor :(")),
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/imPoor.jpg'),
          ),
        ),
      ),
    ),
  );
}
