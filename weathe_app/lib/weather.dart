class Weather {
  static String city='Thu Duc';
  final String temp;
  final int pressure;
  final int humidity;
  final double wind;
  final String name;
  final String stateWeather;
  const Weather({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.wind,
    required this.name,
    required this.stateWeather
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: double.parse(json['main']['temp'].toString()).roundToDouble().toString()
    , pressure: json['main']['pressure']
    , humidity: json['main']['humidity']
    , wind: json['wind']['speed']
    , name: json['name']
    , stateWeather: json['weather'][0]['description']
    );
  }
}

