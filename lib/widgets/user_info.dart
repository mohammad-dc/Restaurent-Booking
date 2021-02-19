import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class UserInfoBox extends StatelessWidget {
  final Icon icon;
  final String headline;
  final String value;
  UserInfoBox({this.icon, this.headline, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          SizedBox(
            width: 6.0,
          ),
          Text(
            headline,
            style: TextStyle(
              fontSize: 17.0,
              color: blackColor,
              fontFamily: 'Cairo',
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 17.0,
              color: blackColor,
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    );
  }
}
