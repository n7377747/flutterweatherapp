class WeatherData {
  final DateTime date;
  final String name;
  final double temp;
  final String main;
  final String icon;
  final double windSpeed;
  final double windTemperature;
  final double humidity;
  final double pressure;
  final double visibility;

  WeatherData({
    this.date,
    this.name,
    this.temp,
    this.main,
    this.icon,
    this.windSpeed,
    this.windTemperature,
    this.humidity,
    this.pressure,
    this.visibility,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
        date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
            isUtc: false),
        name: json['name'],
        temp: json['main']['temp'].toDouble(),
        main: json['weather'][0]['main'],
        icon: json['weather'][0]['icon'],
        windSpeed: json['wind']['speed'].toDouble(),
        windTemperature: json['wind']['deg'].toDouble(),
        visibility: json['visibility'].toDouble(),
        humidity: json['main']['humidity'].toDouble(),
        pressure: json['main']['pressure'].toDouble());
  }
}
