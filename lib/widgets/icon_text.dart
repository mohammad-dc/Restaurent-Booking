import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class IconText extends StatelessWidget {
  final String text;
  final Icon icon;
  IconText({this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: icon,
          onPressed: () {},
          color: grayColormax,
        ),
        Text(
          text,
          style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              color: grayColormax,
              fontSize: 15.0),
        ),
      ],
    );
  }
}
