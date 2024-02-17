import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:machinetask/model/current_weather_model.dart';
import 'package:machinetask/repo/api_status.dart';
import 'package:machinetask/utils/strings.dart';

class WeatherService with ChangeNotifier {
  dynamic currentWeatherData;
  var latitude;
  var longitude;
  getCurrentWeather() async {
    try {
      var link =
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$API_KEY&units=metric";
      var res = await http.get(Uri.parse(link));
      if (res.statusCode == 200) {
        var data = currentWeatherDataFromJson(res.body.toString());
        notifyListeners();
        return data;
      }
    } catch (e) {}
  }

  getUserLocation() async {
    bool isLocationEnabled;
    LocationPermission userPermission;

    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      return Future.error("Location is not enabled");
    }

    userPermission = await Geolocator.checkPermission();
    if (userPermission == LocationPermission.deniedForever) {
      return Future.error("Permission is denied forever");
    } else if (userPermission == LocationPermission.denied) {
      userPermission = await Geolocator.requestPermission();
      if (userPermission == LocationPermission.denied) {
        return Future.error("Permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      latitude = value.latitude;
      longitude = value.longitude;
      // isloaded.value = true;
      // update();
    });
  }
}
