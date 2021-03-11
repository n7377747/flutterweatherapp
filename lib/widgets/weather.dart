import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weatherModel.dart';
import 'package:google_fonts/google_fonts.dart';

class Weather extends StatelessWidget {
  final WeatherData weather;

  Weather({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            elevation: 10,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.place),
                      Text(
                        weather.name,
                        style: GoogleFonts.getFont('Montserrat'),
                      ),
                      Text(
                        weather.main,
                        style: GoogleFonts.getFont(
                          'Maven Pro',
                          fontSize: 40,
                        ),
                      ),
                      Image.network(
                        'https://openweathermap.org/img/w/${weather.icon}.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '${weather.temp.toString()}°F',
                        style: GoogleFonts.getFont(
                          'Nunito',
                          fontSize: 40,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        new DateFormat.yMMMd().format(weather.date),
                        style: GoogleFonts.getFont("Work Sans"),
                      ),
                      Text(
                        new DateFormat.Hm().format(weather.date),
                        style: GoogleFonts.getFont("Work Sans",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              height: 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      getTile("Humidity", weather.humidity),
                      Divider(
                        color: Colors.black,
                      ),
                      getTile("Pressure", weather.pressure),
                      Divider(
                        color: Colors.black,
                      ),
                      getTile("Visibility", weather.visibility),
                      Divider(
                        color: Colors.black,
                      ),
                      getTile("wind speed", weather.windSpeed),
                      Divider(
                        color: Colors.black,
                      ),
                      getTile("wind Temperature", weather.windTemperature),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getTile(String key, double value) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          key,
          style: GoogleFonts.getFont("Work Sans"),
        ),
        Text(
          value.toString(),
          style: GoogleFonts.getFont("Work Sans"),
        ),
      ],
    ),
  );
}
