// https://medium.flutterdevs.com/explore-widget-lifecycle-in-flutter-e36031c697d0

import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';

const apiKey = 'YOUR_API_KEY_HERE';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  double latitude = 0;
  double longitude = 0;

  // This state runs only once when the app is loaded
  @override
  void initState() {
    super.initState();
    getLocationData();
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

  void getLocationData() async {
    await location.getCurrentPosition();
    // print('${location.latitude}');
    // print('${location.longitude}');

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }
}
