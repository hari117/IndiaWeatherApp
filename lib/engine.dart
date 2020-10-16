import 'package:dio/dio.dart';
import 'filterData.dart';
import 'JsonData.dart';

class WeatherClient {
  Dio dio = new Dio();
  String city = "Mumbai";
  int counter = 0;
  String apiKey = "ba60917b16600492f356a72278064a98";
  setCity(String name) {
    city = name;
  }

  Future<WeatherDetail> getRequest() {
    Future<Response> futureLinkData = dio.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=ba60917b16600492f356a72278064a98");
    Future<WeatherDetail> futureResponseData = futureLinkData.then((body) {
      var value = body.data;

      WeatherTo weatherTo = WeatherTo.fromJson(value);
      WeatherDetail weatherDetail = WeatherDetail(weatherTo);

      return Future.delayed(Duration(seconds: 1), () => weatherDetail);
    }).catchError((error) {
      print(error);
      return Future.error(error);
    });

    return futureResponseData;
  }
}
