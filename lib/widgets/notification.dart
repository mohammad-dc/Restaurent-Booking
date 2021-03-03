import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class UserNotification extends StatelessWidget {
  final String image;
  final String time;
  final String date;
  UserNotification({this.image, this.time, this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          border: Border.all(width: .5, color: grayColormax),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(image),
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'سيتم تحضير الوجبة خلال' + " " + time,
              style: TextStyle(
                  fontFamily: 'Cairo', color: blackColor, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.history,
                  size: 13.0,
                  color: grayColormax,
                ),
                Text(
                  date,
                  style: TextStyle(
                      color: grayColormax, fontFamily: 'Cairo', fontSize: 14.0),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
