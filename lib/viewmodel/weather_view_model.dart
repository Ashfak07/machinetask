import 'package:flutter/material.dart';
import 'package:machinetask/repo/weather_service.dart';

class WeatherViewModel with ChangeNotifier {
  WeatherService service = WeatherService();
  getWeatherData() async {
    var response = await service.getCurrentWeather();
    return response;
  }
}
