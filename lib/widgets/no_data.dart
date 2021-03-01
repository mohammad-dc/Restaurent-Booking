import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class NoData extends StatelessWidget {
  final String text;

  NoData({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
      decoration: BoxDecoration(
        border: Border.all(width: .5, color: grayColormin),
        borderRadius: BorderRadius.circular(5.0),
        color: grayColormin, 
      ),
      child: Text(
        text,
        style: TextStyle(
          color: blackColor,
          fontFamily: 'Cairo',
          fontSize: 15.0
        ),
      ),
    );
  }
}