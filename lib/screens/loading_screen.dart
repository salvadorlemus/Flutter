// https://medium.flutterdevs.com/explore-widget-lifecycle-in-flutter-e36031c697d0

import 'package:flutter/material.dart';
import '../screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // This state runs only once when the app is loaded
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // This state runs every time the app is re-loaded
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }

  // This state runs every time the [app / page / screen] is closed
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  void getLocationData() async {
    // Get the weather data from the API
    var weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
              // This is the new screen that will be loaded
              locationWeather: weatherData);
        },
      ),
    );
  }
}
