import 'JsonData.dart';
import 'engine.dart';

class WeatherDetail {
  double coordsLon;
  double coordsLat;
  String weatherType;
  double temparature;
  String country;
  String cityName;

  WeatherDetail(WeatherTo weather) {
    coordsLon = weather.coord.lon;
    coordsLat = weather.coord.lat;
    weatherType = weather.weather[0].main;
    temparature = weather.main.temp;
    country = weather.sys.country;
    cityName = weather.name;
  }
}
