import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/forecastModel.dart';
import 'package:weather_app/model/weatherModel.dart';
import 'package:weather_app/widgets/weather.dart';
import 'package:weather_app/widgets/weatherItem.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isLoading = false;
  WeatherData weatherData;
  ForecastData forecastData;

  loadWeather() async {
    setState(() {
      isLoading = true;
    });
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print(e);
    }

    if (position != null) {
      final lat = position.latitude;
      final lon = position.longitude;

      final weatherResponse = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?APPID=3566a79f57d6e2cfc71eb39d8c91bc22&lat=${lat.toString()}&lon=${lon.toString()}'));
      final forecastResponse = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?APPID=3566a79f57d6e2cfc71eb39d8c91bc22&lat=${lat.toString()}&lon=${lon.toString()}"));

      if (weatherResponse.statusCode == 200 &&
          forecastResponse.statusCode == 200) {
        return setState(() {
          weatherData =
              new WeatherData.fromJson(jsonDecode(weatherResponse.body));
          forecastData =
              new ForecastData.fromJson(jsonDecode(forecastResponse.body));
          isLoading = false;
        });
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.date_range,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "DAILY SUMMARY",
              style: GoogleFonts.getFont('Work Sans', color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.grey[50],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                weatherData != null
                    ? Weather(weather: weatherData)
                    : Container(
                        child: Text("No response!"),
                      ),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200.0,
                  child: forecastData != null
                      ? ListView.builder(
                          itemCount: forecastData.list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => WeatherItem(
                              weather: forecastData.list.elementAt(index)))
                      : Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
