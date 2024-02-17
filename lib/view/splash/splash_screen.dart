import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:machinetask/repo/weather_service.dart';
import 'package:machinetask/view/homeview/home_view.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    //Provider.of<WeatherService>(context).getUserLocation();

    Future.delayed(Duration(seconds: 4))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: LottieBuilder.asset(
              'assets/lottie/Animation - 1702057341842.json')),
    );
  }
}
