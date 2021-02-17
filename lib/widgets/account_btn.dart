import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class AccountBtn extends StatelessWidget {
  final String text;
  final String navigatorPageRoute;
  AccountBtn({this.text, this.navigatorPageRoute});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => {Navigator.of(context).pushNamed(navigatorPageRoute)},
      textColor: whiteColor,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 25.0,
              color: whiteColor,
              fontWeight: FontWeight.w400),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [gradientColor1, gradientColor2]),
        ),
      ),
    );
  }
}
