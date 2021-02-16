import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'admin_or_user.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AdminOrUser())));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [gradientColor1, gradientColor2, gradientColor3])),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'حجوزات',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      decoration: TextDecoration.none,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
                SizedBox(height: 30.0),
                SpinKitPulse(color: whiteColor)
              ]),
        ));
  }
}
