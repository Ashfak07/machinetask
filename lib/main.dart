import 'package:flutter/material.dart';
import 'package:machinetask/repo/weather_service.dart';
import 'package:machinetask/view/homeview/home_view.dart';
import 'package:machinetask/view/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => WeatherService())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          home: SplashScreen(),
        ));
  }
}
