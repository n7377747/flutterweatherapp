import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weatherModel.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherItem extends StatelessWidget {
  final WeatherData weather;

  WeatherItem({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              weather.name,
              style: GoogleFonts.getFont('Montserrat'),
            ),
            Text(
              weather.main,
              style: GoogleFonts.getFont(
                'Maven Pro',
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
                'https://openweathermap.org/img/w/${weather.icon}.png'),
            Text('${weather.temp.toString()}°F',
                style: GoogleFonts.getFont('Nunito')),
            Text(
              new DateFormat.yMMMd().format(weather.date),
              style: GoogleFonts.getFont("Work Sans"),
            ),
            Text(
              new DateFormat.Hm().format(weather.date),
              style: GoogleFonts.getFont("Work Sans"),
            ),
          ],
        ),
      ),
    );
  }
}
