import 'package:covid_19_tracker/networking.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCountryData();
  }

  void getCountryData() async {
    NetworkHelper networkHelper =
        NetworkHelper("v2/countries/philippines");
    NetworkHelper networkHelperglobal = NetworkHelper("v2/all");
    var countryData = await networkHelper.getCountryData();
    var globalData = await networkHelperglobal.getAllData();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Dashboard(
          country: countryData,
          global: globalData,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      title: const Text(
        'Corona Virus Tracker',
        style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
            color: Colors.white),
      ),
      backgroundImage: const AssetImage('assets/images/bg.jpg'),
      logo: Image.asset(
        'assets/images/corona.png',
        scale: 1.5,
      ),
      loaderColor: Colors.red,
    );
  }
}
