// https://medium.flutterdevs.com/explore-widget-lifecycle-in-flutter-e36031c697d0

import 'package:flutter/material.dart';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // This state runs only once when the app is loaded

  Location location = Location();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  // This state runs every time the app is re-loaded
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  // This state runs every time the [app / page / screen] is closed
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  void getLocation() async {
    await location.getCurrentPosition();
    print('${location.latitude}');
    print('${location.longitude}');
  }
}
