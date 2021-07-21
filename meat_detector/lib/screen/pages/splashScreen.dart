import 'package:flutter/material.dart';
import 'package:meat_detector/screen/components/constant.dart';

import 'homePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(
        seconds: 3,
      ),
      (){
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warna1(),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: screenHeight(context)*(1/4),
        ),
      ),
    );
  }
}