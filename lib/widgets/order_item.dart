import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class OrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          border: Border.all(width: .5, color: grayColormax),
          borderRadius: BorderRadius.circular(50.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  'https://topmeaning.com/english/images/img/EN/g/guy.jpg',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'همام صباح',
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 15.0,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.info,
                    size: 25,
                    color: grayColormax,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 25,
                    color: grayColormax,
                  ),
                  onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}
